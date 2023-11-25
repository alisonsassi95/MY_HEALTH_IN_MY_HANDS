import json
import requests
import pytest

def sendData(url, data):
    headers = {"Content-Type": "application/json"}

    try:
        response = requests.post(url, data=json.dumps(data), headers=headers)
        return response
    except requests.RequestException as e:
        print(f"Erro de conexão: {e}")
        return None

class TestAPI:

    @pytest.fixture
    def api_url(self):
        return "http://localhost:8000/process_data"

    def test_successful_post(self, api_url):
        # Dados de teste
        data = {
            "nome": "Joao",
            "sobrenome": "Silva",
            "data_nascimento": "11/11/2000",
            "tipo_sangue": "O+"
        }

        # Chamar a função de envio de dados
        response = sendData(api_url, data)

        # Verificar se a resposta é bem-sucedida
        assert response.status_code == 200
        assert response.json() == {"status": "Dados recebidos com sucesso!", "statusCode": 200}

    def test_failed_post(self, api_url):
        # Dados de teste com valores ausentes
        data = {
            "nome": "Joao",
            "sobrenome": "Silva",
            "data_nascimento": "", # 
            "tipo_sangue": "O+"
        }

        # Chamar a função de envio de dados
        response = sendData(api_url, data)

        # Verificar se a resposta indica um erro
        assert response.status_code == 400
        assert "campo 'data_nascimento' não pode ser nulo" in response.text

if __name__ == "__main__":
    pytest.main()
