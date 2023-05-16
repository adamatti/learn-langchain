# Source: https://betterprogramming.pub/talking-to-pdfs-gpt-4-and-langchain-77f44f23505d
# import PyPDF2
from langchain import LangChain
from flask import Flask, request, jsonify

app = Flask(__name__)
model = LangChain()

# Add the PDF files to the model
for pdf_file in data['pdf_files']:
    model.add_document(pdf_file['title'], pdf_file['text'])

# Train the model
model.train()

@app.route('/ask', methods=['POST'])
def ask():
    # Get the question from the request
    question = request.json['question']

    # Generate a response to the question
    response = model.generate_response(question)

    # Return the response as JSON
    return jsonify({'response': response})

if __name__ == '__main__':
    app.run()