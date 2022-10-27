# Save docker modifications

## Run image using daemon mode
`docker -d -it image /bin/bash`

## Enter the container
`docker exec -it <container hash> /bin/bash`

Install required programs and exit the container.

## Export modifications
`docker export <container hash> > name.tar`

## Import created container
`docker import name.tar name:latest`

## Using modified image
Then, run and execute the customized image/container.

`docker run -d -it name /bin/bash`
`docker exec -it <container hash> /bin/bash`
