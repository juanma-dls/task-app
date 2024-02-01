# Task App

This is a project management application where users can interact with tasks.

## Technologies

- Rails 7.1
- Ruby 3.1.0
- Docker

## Dependencies

- **Devise**: Used for user authentication.
- **CanCan**: Manages permissions and authorization control.

## Getting Started
> For more information about make commands, see the **makefile**.

Follow these steps to set up and run the project:

1. **Clone the repository:**

git clone https://github.com/juanma-dls/task-app.git

2. **Navigate by folder**

`cd task-app`

3. **Create an environment file:**

- Create a new file named .env:
- Use the provided .env.example file as a template.

`tocuh .env`

4. **Build image of docker**

`make build`

5. **Lift containers**

`make up`

6. **Run migrations and seeder**

`make migrate-seed`


