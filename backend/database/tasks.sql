-- Define the users table
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT NOT NULL UNIQUE,
  password TEXT NOT NULL,
  role VARCHAR(255)
);

-- Define the tasks table
CREATE TABLE tasks (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT,
  due_date TIMESTAMP,
  priority VARCHAR(255),
  status VARCHAR(255),
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,
  completed BOOLEAN DEFAULT false,
  creator_id INTEGER REFERENCES users (id) ON DELETE CASCADE
);

-- Define the task_assignments table
CREATE TABLE task_assignments (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users (id) ON DELETE CASCADE,
  task_id INTEGER REFERENCES tasks (id) ON DELETE CASCADE,
  assigned_at TIMESTAMP NOT NULL,
  completed_at TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users (id), 
  FOREIGN KEY (task_id) REFERENCES tasks (id)
);

-- Create a table for customer data
CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  email VARCHAR(255),
  phone VARCHAR(255),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create a table for product data
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  description TEXT,
  price NUMERIC(10, 2),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
