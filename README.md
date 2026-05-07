# Kanban Board with Time Travel

A modern Kanban Board application built using Ruby on Rails and React with drag-and-drop functionality and historical event tracking (Time Travel feature).

---

## Features

- Create Columns
- Create Cards
- Edit Cards
- Delete Cards
- Drag & Drop Cards
- Move Cards Between Columns
- Board Event Tracking
- Time Travel / Historical View
- REST API Architecture
- React Frontend with Rails Backend

---

# Tech Stack

## Backend
- Ruby 3.2.2
- Rails 8.1.3
- PostgreSQL

## Frontend
- React
- Vite
- Tailwind CSS
- React Beautiful DnD

---

# Project Setup

## Clone Repository

```bash
git clone git@github.com:ashwin-borkar/kanban_board.git
cd kanban_board
```

---

# Ruby Version

```bash
ruby -v
```

Expected:

```bash
ruby 3.2.2
```

---

# Rails Version

```bash
rails -v
```

Expected:

```bash
Rails 8.1.3
```

---

# Install Dependencies

## Backend Gems

```bash
bundle install
```

## Frontend Packages

```bash
npm install
```

or

```bash
yarn install
```

---

# Database Setup

## Create Database

```bash
rails db:create
```

## Run Migrations

```bash
rails db:migrate
```

## Seed Database (Optional)

```bash
rails db:seed
```

---

# Start Application

## Start Rails Server

```bash
bin/rails server
```

Runs on:

```bash
http://localhost:3000
```

---

## Start Vite Frontend

Open another terminal:

```bash
bin/vite dev
```

Runs on:

```bash
http://localhost:3036
```

---

# API Endpoints

## Columns

| Method | Endpoint | Description |
|--------|-----------|-------------|
| GET | /api/v1/columns | Get all columns |
| POST | /api/v1/columns | Create column |
| PATCH | /api/v1/columns/:id | Update column |
| DELETE | /api/v1/columns/:id | Delete column |

---

## Cards

| Method | Endpoint | Description |
|--------|-----------|-------------|
| GET | /api/v1/cards | Get all cards |
| POST | /api/v1/cards | Create card |
| PATCH | /api/v1/cards/:id | Update card |
| DELETE | /api/v1/cards/:id | Delete card |

---

# Time Travel Feature

The application tracks board events and allows users to:

- View historical board states
- Restore previous changes
- Track card movement history
- Monitor updates over time

---

# Folder Structure

```bash
app/
├── controllers/
├── models/
├── views/
├── frontend/
├── services/
└── jobs/
```

---

# Useful Commands

## Rails Console

```bash
rails console
```

## Run Tests

```bash
rails test
```

## Routes

```bash
rails routes
```

## Reset Database

```bash
rails db:reset
```

## Drop Database

```bash
rails db:drop
```

---

# Git Commands

## Initialize Git

```bash
git init
```

## Add Remote Repository

```bash
git remote add origin git@github.com:ashwin-borkar/kanban_board.git
```

## Add Files

```bash
git add .
```

## Commit Changes

```bash
git commit -m "Initial commit - Kanban board application"
```

## Push to GitHub

```bash
git push -u origin main
```

---

# Future Improvements

- User Authentication
- Real-time Updates
- Activity Logs
- Notifications
- Docker Deployment
- CI/CD Pipeline

---

# Author

Ashwin Borkar

GitHub:
https://github.com/ashwin-borkar

---

# License

MIT License
