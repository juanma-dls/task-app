# Task App

This is a project management application where users can interact with tasks.

## Technologies

- Rails 7.1
- Ruby 3.1.0

## Dependencies

- **Devise**: Used for user authentication.
- **CanCan**: Manages permissions and authorization control.

## Getting Started

Follow these steps to set up and run the project:

1. **Clone the repository:**

git clone https://github.com/juanma-dls/task-app.git

2. **Navigate by folder**

`cd task-app`

3. **Create an environment file:**
- Use the provided .env.example file as a template.
- Create a new file named .env:

`tocuh .env`

4. **Navigate by folder**
* Create database

`rails db:create`

5. **Navigate by folder**
* Run migrations and seeds
`rails db:migrate`
`rails db:seed`
