# Docker Hello World

This is a simple "Hello, World!" example using Docker.

## Dockerfile

```dockerfile
FROM alpine:latest
CMD ["echo", "Hello, World!"]
```

### `Dockerfile` Explained

*   `FROM alpine:latest`: This line sets the base image for our container. We're using `alpine:latest`, which is a very small and secure Linux distribution.
*   `CMD ["echo", "Hello, World!"]`: This is the command that will run when you start the container. It simply prints "Hello, World!" to your terminal.

## Next Steps: Build and Run

Now, let's build the Docker image and run the container.

1.  **Build the image:** This command reads the `Dockerfile` and builds your container image. We'll tag it with the name `hello-world-app`.
    ```bash
    docker build -t hello-world-app .
    ```

2.  **Run the container:** This command starts a container from the image you just built.
    ```bash
    docker run hello-world-app
    ```

---
*Original content from README.md:*
https://ithelp.ithome.com.tw/m/articles/10260570
