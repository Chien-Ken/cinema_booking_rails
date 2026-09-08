# CineGlass - Cinema Booking Application 🎬

A full-stack web application designed for movie enthusiasts to browse showtimes, reserve seats in real time, and securely purchase tickets online. Built with Ruby on Rails 8 for the backend/frontend, Redis for concurrent seat locking, and Stripe API for payment processing.

---

## ✨ Features

* **User Authentication & Role Management:** Secure sign-up/login, profile management, and dedicated Admin Portal for showtime, theater, and movie configuration.
* **Real-time Seat Selection:** Interactive seat mapping with live status updates.
* **Concurrency Control (Atomic Locking):** 10-minute temporary seat lease powered by Redis to strictly prevent double-booking/race conditions across concurrent users.
* **Automated Payments:** Seamless checkout flow integrated with Stripe PaymentIntent API and asynchronous Webhooks for transaction verification.
* **Movie & Showtime Discovery:** Search and filter movies using full-text search (`pg_search`).
* **Multi-Language Support:** English and Vietnamese language toggling.

---

## 🛠️ Technologies Used

* **Backend & Frontend:** Ruby on Rails 8, Hotwire (Turbo / Stimulus), Tailwind CSS
* **Database:** PostgreSQL
* **Caching & Concurrency:** Redis
* **Third-Party Services:** Stripe API (Payments), Amazon S3 (Media Storage via Active Storage)
* **Containerization & Deployment:** Docker, Docker Compose, AWS EC2
* **Secrets Management:** Rails Encrypted Credentials (`credentials.yml.enc`)

---

## 📋 Prerequisites

Before running the application, ensure you have the following installed on your local system:

* **Ruby:** Version 3.x (Matching your `.ruby-version`)
* **Bundler:** Version 2.x or higher (`gem install bundler`)
* **PostgreSQL:** Version 14 or higher running locally
* **Redis Server:** Required for atomic seat locking (`redis-server`)
* **Docker & Docker Compose (Optional):** Required if running via containerization

---

## 🚀 Getting Started

Follow these steps to get the application up and running locally.

### 1. Clone the Repository

```bash
git clone [https://github.com/your-username/cinema_booking_rails.git](https://github.com/your-username/cinema_booking_rails.git)
cd cinema_booking_rails

2. Install Dependencies
bundle install

3. Master Key & Credentials Setup
This project uses Rails Encrypted Credentials to manage sensitive secrets (Stripe Keys, AWS Keys).
Ensure you have the config/master.key file provided in your local environment.
To view or edit configured secrets:

EDITOR="code --wait" rails credentials:edit

(For template structure, refer to config/credentials.yml.enc.example if available).

4. Database Setup
Ensure your local PostgreSQL server is running, then execute:
rails db:create db:migrate db:seed


🏃 Running the Application
You can run the application either natively or using Docker Compose.

Option 1: Running Natively
rails server

Access the application in your browser at: http://localhost:3000

Option 2: Using Docker Compose (RECOMMENDED)
Ensure Docker Desktop is running, then build and start all containerized services (Rails App, PostgreSQL, Redis):

docker compose up --build

To run the containers in the background:

docker compose up -d

Access the application in your browser at: http://localhost:3000

Development Credentials
For quick testing, you can use the pre-configured admin account (generated via rails db:seed):

Email: admin@cinema.com

Password: password123 (or your custom seed password)


