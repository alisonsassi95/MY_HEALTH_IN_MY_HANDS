

# Criar ambiente virtual
python -m venv venv

# ativar ambiente virtual
source ./venv/Scripts/activate


# Tutorial Fast API
https://fastapi.tiangolo.com/pt/tutorial/first-steps/

# instalaçoes:
Instale o "requirements.txt".. contém tudo. :D
pip install -r requirements.txt
->
pip install "fastapi[all]"
pip install pytest
pip install firebase-admin

# Rodar um comando para armazenar as dependencias 
pip freeze > requirements.txt




# Rodar API
uvicorn main:app --reload

# 
