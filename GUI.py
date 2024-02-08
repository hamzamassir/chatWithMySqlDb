import os
import tkinter as tk
import tkinter.ttk as ttk
from langchain.agents import create_sql_agent
from langchain_community.agent_toolkits import SQLDatabaseToolkit
from langchain.sql_database import SQLDatabase
from langchain_openai import OpenAI

# Set sensitive information using environment variables
os.environ['OPENAI_API_KEY'] = "...." #generated API key
mysql_host = os.getenv("MYSQL_HOST", "localhost")
mysql_user = os.getenv("MYSQL_USER", "root")
mysql_password = os.getenv("MYSQL_PASSWORD", "")
mysql_db = os.getenv("MYSQL_DB", "sample_db_2")

# Create a MySQL engine
db = SQLDatabase.from_uri(f"mysql+mysqlconnector://{mysql_user}:{mysql_password}@{mysql_host}/{mysql_db}")

# Create an OpenAI language model
llm = OpenAI(temperature=0)

# Create a SQL agent toolkit
toolkit = SQLDatabaseToolkit(db=db, llm=llm)

# Create a SQL agent executor
agent_executor = create_sql_agent(llm=llm, toolkit=toolkit, verbose=True)

# Create the UI window
root = tk.Tk()
root.title("Chat with Tabular Data")

# Create the text entry widget
entry = ttk.Entry(root, font=("Arial", 14))
entry.pack(padx=20, pady=20, fill=tk.X)

# Create the button callback
def on_click():
    try:
        # Get the query text from the entry widget
        query = entry.get()

        # Run the query using the agent executor
        result = agent_executor.run(query)

        # Display the result in the text widget
        text.config(state=tk.NORMAL)  # Enable editing
        text.delete("1.0", tk.END)
        text.insert(tk.END, result)
        text.config(state=tk.DISABLED)  # Disable editing
    except Exception as e:
        # Display meaningful error message in case of an exception
        text.config(state=tk.NORMAL)
        text.delete("1.0", tk.END)
        text.insert(tk.END, f"Error: {str(e)}")
        text.config(state=tk.DISABLED)

# Create the button widget with a modified appearance
button_style = ttk.Style()
button_style.configure("Chat.TButton", font=("Arial", 14), foreground="black", background="#4CAF50", padding=10)
button = ttk.Button(root, text="Chat", command=on_click, style="Chat.TButton")
button.pack(padx=20, pady=20)

# Create the text widget to display the result with a modified appearance
text = tk.Text(root, height=10, width=60, font=("Arial", 14), background="#E0E0E0", borderwidth=2, relief="solid")
text.pack(padx=20, pady=20)
text.config(state=tk.DISABLED)  # Disable editing

# Start the UI event loop
root.mainloop()
