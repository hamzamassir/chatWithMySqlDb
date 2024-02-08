# Utilize ChatGPT for Conversations with Tabular/SQL Data

## Installation

To kick-start the process, install the LangChain library by executing the following command:

```bash
pip install langchain
```

## Setting Up the Environment

Utilizing LangChain often involves integrating with various model providers, data stores, APIs, etc.

For this specific illustration, we will employ OpenAI's APIs. Begin by installing their SDK:

```bash
pip install openai
```

Afterward, set the environment variable in the terminal. Execute the following command, replacing `"..."` with your actual OpenAI API key:

```bash
export OPENAI_API_KEY="..."
```

Alternatively, you can perform this step from within a Jupyter notebook or a Python script:

```python
import os
os.environ["OPENAI_API_KEY"] = "..."
```
