import firebase_admin
from firebase_admin import credentials, firestore

class FirebaseClient:
    def __init__(self, cred_path, collection_name):
        cred = credentials.Certificate(cred_path)
        firebase_admin.initialize_app(cred)
        self.db = firestore.client()
        self.collection_name = collection_name

    def cadastrar_pessoa(self, data):
        """
        Cadastra uma nova pessoa no Firebase.

        Args:
        - data (dict): Um dicionário contendo as informações da pessoa.
          - nome (str): O nome da pessoa.
          - sobrenome (str): O sobrenome da pessoa.
          - data_nascimento (str): A data de nascimento da pessoa (no formato YYYY-MM-DD).
          - tipo_sangue (str): O tipo sanguíneo da pessoa.
        """
        doc_ref = self.db.collection(self.collection_name).add(data)
        return {"status": "Dados armazenados com sucesso!", "statusCode": 200, "document_id": doc_ref.id}

# Utilização da classe
firebase = FirebaseClient(cred_path="path/to/your/firebase-credentials.json", collection_name="pessoas")

# Exemplo de como usar a classe para cadastrar uma pessoa
dados_pessoa = {
    "nome": "João",
    "sobrenome": "Silva",
    "data_nascimento": "1990-01-01",
    "tipo_sangue": "O+"
}

resultado_cadastro = firebase.cadastrar_pessoa(dados_pessoa)
print(resultado_cadastro)
