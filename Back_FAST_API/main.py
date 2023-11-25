from fastapi import FastAPI, HTTPException
from typing import Dict

app = FastAPI()


@app.get("/")
async def begin():
    return {"message": "Let's Go! Odin!"}

@app.post("/process_data")
async def process_data(data: Dict[str, str]):
    """
    Cadastra uma nova pessoa.

    Args:
    - data (dict): Um dicionário contendo as informações da pessoa.
      - nome (str): O nome da pessoa.
      - sobrenome (str): O sobrenome da pessoa.
      - data_nascimento (str): A data de nascimento da pessoa (no formato DD-MM-YYYY).
      - tipo_sangue (str): O tipo sanguíneo da pessoa.

    Returns:
    - dict: Um dicionário indicando o status da operação.
      - status (str): Mensagem indicando o status da operação.
      - statusCode (int): O código de status HTTP resultante da operação.
    
    Raises:
    - HTTPException: Uma exceção HTTP com detalhes sobre campos obrigatórios não preenchidos.
      - status_code (int): O código de status HTTP (400 Bad Request).
      - detail (str): Mensagem detalhando qual campo não pode ser nulo.
    """

    nome = data.get("nome")
    sobrenome = data.get("sobrenome")
    data_nascimento = data.get("data_nascimento")
    tipo_sangue = data.get("tipo_sangue")

    if nome and sobrenome and data_nascimento and tipo_sangue:
        return {"status": "Dados recebidos com sucesso!", "statusCode": 200}
    else:
        if not nome:
            raise HTTPException(status_code=400, detail="O campo 'nome' não pode ser nulo.")
        elif not sobrenome:
            raise HTTPException(status_code=400, detail="O campo 'sobrenome' não pode ser nulo.")
        elif not data_nascimento:
            raise HTTPException(status_code=400, detail="O campo 'data_nascimento' não pode ser nulo.")
        elif not tipo_sangue:
            raise HTTPException(status_code=400, detail="O campo 'tipo_sangue' não pode ser nulo.")
