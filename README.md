# Desafio Técnico - Cientista de Dados Júnior

## Descrição

Este repositório contém a solução para o desafio técnico de Cientista de Dados Júnior, incluindo análises realizadas em dados públicos e a visualização dos resultados utilizando o Looker Studio.

## Como Utilizar os Códigos

### 1. Clonagem do Repositório

Clone este repositório para seu ambiente local para acessar todos os arquivos necessários e garantir que você tenha a versão correta dos arquivos.

```bash
git clone https://github.com/BrunoMateus28/emd-desafio-junior-data-scientist
```

### 2. Configuração do Ambiente

Para executar o projeto, siga estas etapas:

1. **Instalação das Bibliotecas Necessárias**:
   - Instale as bibliotecas necessárias para executar o código Python, como `basedosdados`, `pandas`, e `google-cloud-bigquery`. Use os comandos abaixo para instalar as bibliotecas:

     ```bash
     pip install basedosdados
     pip install --upgrade google-cloud-bigquery
     ```

2. **Configuração do Google BigQuery**:
   - **Acessar o Console do Google Cloud**:
     - Acesse o [Console do Google Cloud](https://console.cloud.google.com/).
     - Pesquise por BigQuery e selecione a opção correspondente.
     - Crie um novo projeto ou selecione um projeto existente.
     - Note o `project_id` do seu projeto para uso posterior no código.

   - **Configuração das Credenciais**:
     - Configure as credenciais do Google BigQuery conforme necessário. Certifique-se de que seu projeto está corretamente configurado para executar consultas SQL.

3. **Execução do Código SQL**:
   - Copie e execute o conteúdo dos arquivos de consulta SQL no BigQuery. Lembre-se de monitorar seu uso de cota para evitar exceder o limite.

4. **Execução do Código Python**:
   - **Google Colab**:
     - Faça o upload do notebook `analise_python.ipynb` no Google Colab.
     - Execute as células do notebook para realizar a análise. O Colab permite a execução interativa e facilita a configuração inicial das bibliotecas.

   - **Jupyter Notebook**:
     - Se preferir usar Jupyter Notebook, faça o download do notebook e execute-o localmente.
     - Certifique-se de ter todas as bibliotecas necessárias instaladas no seu ambiente Jupyter.
     - Permita a instalação das bibliotecas na primeira execução do notebook. Após isso, você pode comentar a célula de instalação para economizar tempo em execuções subsequentes.

5. **Execução da Análise de APIs**:
   - Certifique-se de que o arquivo `descriptions.json` está na mesma pasta que o arquivo `analise_api.ipynb`. Execute o código para obter dados de APIs públicas.

### 3. Visualização dos Dados

Os resultados das análises são apresentados em um dashboard interativo no Looker Studio. Para visualizar o dashboard:

1. **Acesse o Looker Studio**:
   - Utilize o link fornecido para acessar a visualização interativa dos dados.

   [Dashboard Looker Studio](https://lookerstudio.google.com/reporting/855c3bfb-9e91-4f51-bd20-b6965e1f2273)

2. **Exploração do Dashboard**:
   - O dashboard mostra os padrões importantes identificados nas análises, como a distribuição dos chamados, e a relação entre bairros e tipos de chamados.

## Observações Finais

Caso encontre problemas durante a execução ou instalação das bibliotecas, consulte a documentação das ferramentas usadas e verifique as soluções propostas neste README. Se precisar de ajuda adicional, entre em contato através do e-mail responsável pelo desafio.
