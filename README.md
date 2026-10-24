# MeetFlow — TeamLift Internship Challenge

A full-stack scheduling application that allows one host to publish available meeting times and guests to book appointments.

**Live Demo:** https://meetflow-scheduling-app-green.vercel.app/

**GitHub:** https://github.com/naunovas/meetflow-scheduling-app

## Tech Stack

- **Frontend:** React, TypeScript, Vite
- **Backend:** Node.js, Express
- **Database:** PostgreSQL (Supabase)
- **Deployment:** Vercel (frontend), Render (backend)

## Features

- Create meeting slots by selecting a date, start time, and duration (15–120 minutes).
- Browse available future meeting slots.
- Book an appointment using a name and email address.
- View available and booked appointments in the host dashboard.
- Persist meeting slots and reservations in PostgreSQL.
- Prevent double booking using an atomic conditional SQL update.
- Responsive interface with separate booking and host dashboard views.

## Architecture

The React frontend communicates with an Express REST API, which handles slot creation, retrieval, and booking.

PostgreSQL stores the meeting slots and reservation information. Booking availability is updated atomically in the database to prevent two guests from reserving the same slot simultaneously.

## Run Locally

**Requirements:** Node.js 20+ and PostgreSQL.

1. Create a PostgreSQL database named `meetflow`.
2. Execute `server/schema.sql` against the database.
3. Configure the backend:

   ```bash
   cd server
   cp .env.example .env
   npm install
   npm start
   ```

4. Configure the frontend in a separate terminal:

   ```bash
   cd client
   cp .env.example .env
   npm install
   npm run dev
   ```

5. Open http://localhost:5173.

Configure `DATABASE_URL` in the backend `.env` file. Set `VITE_API_URL` in the frontend `.env` file when using a backend other than the default local API.

On Windows, use `copy` instead of `cp` in Command Prompt.

## Deployment

The application is deployed using:

- **Vercel:** React frontend
- **Render:** Express REST API
- **Supabase:** Hosted PostgreSQL database

The frontend uses `VITE_API_URL` to connect to the backend, while the backend uses `DATABASE_URL` for PostgreSQL and `CLIENT_ORIGIN` for CORS configuration.

Environment files and database credentials must not be committed to GitHub.

## AI Assistance

ChatGPT was used as a development assistant for implementation guidance, debugging, troubleshooting build errors, and deployment configuration.

The application was tested through local and deployed workflows, including creating meeting slots, booking appointments, checking data persistence, and preventing duplicate reservations.

## Limitations and Future Improvements

The current implementation focuses on the core scheduling workflow.

With more development time, I would add:

- Host authentication and authorization.
- Prevention of overlapping time intervals.
- Explicit timezone selection and handling.
- Email booking confirmations.
- Automated unit and integration tests.
- Google Calendar integration.

For the scope of this challenge, the application supports one host and does not require authentication. The host dashboard is publicly accessible.
