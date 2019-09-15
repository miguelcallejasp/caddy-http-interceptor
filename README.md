# HTTP Catcher Proxy

### Why
You want to print what exact http headers and http body are being sent from one service to another without disrupting anything. 

### Build it
Straightforward build the container:

```
docker build .
```
#### Environment Variables

| Variable  | Description |
| ------------- | ------------- |
| LISTENING_PORT | Define on which port this service will hear HTTP requests. Make sure you have that port exposed or with a service attached in the case of Kubernetes. |
| DESTINATION_ADDRESS | Define where the HTTP Request is going to be forwarded to. |
| DESTINATION_PORT | Define the port of the destination. |


### Run it
You can use the `docker-compose.yaml` example, or the Kubernetes `deployment.yaml` to run it in your environment. Or you can just play using:

```
docker run -it -p 1515:1515 -e LISTENING_PORT=1515 -e DESTINATION_ADDRESS=192.168.1.1 -e DESTINATION_PORT=80 coffeespiller/catcher:latest
```

### Test it
Issue a a `curl http://localhost:1515 -H 'Header: I can see you' -d '{}'`
