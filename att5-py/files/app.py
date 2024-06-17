import os
import subprocess
import boto3
from datetime import datetime

def backup_postgresql_to_s3(db_name, db_password, s3_bucket, aws_access_key_id, aws_secret_access_key, aws_region):
    db_user = 'postgres'

    
    os.environ['PGPASSWORD'] = db_password

    
    backup_file = f"{db_name}_backup_{datetime.now().strftime('%Y%m%d%H%M%S')}.sql"
    
    try:
        
        dump_command = [
            'pg_dump',
            '-h', 'localhost',  
            '-U', db_user,
            '-d', db_name,
            '-F', 'c',  
            '-f', backup_file
        ]

        
        subprocess.check_call(dump_command)
        print(f"Backup do banco de dados {db_name} gerado com sucesso: {backup_file}")

        
        s3_client = boto3.client('s3', aws_access_key_id=aws_access_key_id,
                                      aws_secret_access_key=aws_secret_access_key,
                                      region_name=aws_region)

        
        s3_key = backup_file

        
        s3_client.upload_file(backup_file, s3_bucket, s3_key)
        print(f"Backup enviado para o bucket S3 {s3_bucket} com sucesso: {s3_key}")

    except subprocess.CalledProcessError as e:
        print(f"Erro ao gerar o backup do banco de dados: {e}")
    except Exception as e:
        print(f"Erro ao enviar o backup para o S3: {e}")
    finally:
        
        if os.path.exists(backup_file):
            os.remove(backup_file)

if __name__ == "__main__":
    
    db_name = 'testdb'  
    db_password = '123456' 

    
    s3_bucket = 'backup-mariusso-teste'
    aws_access_key_id = ''
    aws_secret_access_key = ''
    aws_region = 'us-east-1'

    backup_postgresql_to_s3(db_name, db_password, s3_bucket, aws_access_key_id, aws_secret_access_key, aws_region)
