from flask import Flask, request
import requests
import os


app = Flask(__name__)

index = 1
index4 = 1
response_code=200

#/riot-core-services/api/platform/events/MOBILE/404001/Failure

@app.route('/riot-core-services/api/platform/events/MOBILE/404001/Failure', methods=["PUT"])
def start_4000():
    global index4
    index4 +=1
    print("Starting Black Hole")
    if request.method == "PUT":
        start_message = "Fake Response"

        with open('request_payload_4000_'+str(index4)+'.json', 'w') as f:
            print("writing in disk")
            f.write(str(request.json)+"\n"+str(request.headers))
        print(request.json)
        print(request.headers)
        return(start_message, response_code)

@app.route('/riot-core-services/api/platform/events/MOBILE/1005001/Failure', methods=["PUT"])
def start():
    global index
    index +=1
    print("Starting Black Hole")
    if request.method == "PUT":
        start_message = "Fake Response"

        with open('request_payload_'+str(index)+'.json', 'w') as f:
            print("writing in disk")
            f.write(str(request.json)+"\n"+str(request.headers))
        print(request.json)
        print(request.headers)
        return(start_message, response_code)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=9191, debug=True)    