# MeetFlow — TeamLift Internship Challenge

A clean scheduling app for one host and many guests. Built with **React + TypeScript**, **Express**, and **PostgreSQL**.

## Features
- Publish date, start time, and duration (15–120 minutes).
- View available future slots and book with name/email.
- See all slots and booking status on the host dashboard.
- Atomic conditional SQL UPDATE prevents double booking, even under simultaneous requests.
- Data is persisted in PostgreSQL. No login required, as requested.

## Run locally
Requirements: Node.js 20+ and PostgreSQL.

1. Create a database named `meetflow` in PostgreSQL.
2. Run `server/schema.sql` against the database (e.g. `psql -d meetflow -f server/schema.sql`).
3. `cd server && cp .env.example .env` (on Windows: `copy .env.example .env`). Edit `DATABASE_URL`, then run `npm install && npm start`.
4. In another terminal: `cd client && cp .env.example .env` (on Windows: `copy .env.example .env`). Run `npm install && npm run dev`.
5. Visit http://localhost:5173. Open Host dashboard to create a slot, then Booking page to reserve it.

## Deploy
- Deploy `client` to Vercel with framework **Vite**, build `npm run build`, output `dist`, and `VITE_API_URL` pointing to the deployed backend URL.
- Deploy `server` to Render as a Node web service, with root directory `server`, build `npm install`, start `npm start`.
- Create a free PostgreSQL database in Supabase/Neon. Execute `server/schema.sql` in its SQL editor, set `DATABASE_URL` on Render and `DB_SSL=true` if required by the provider. Set `CLIENT_ORIGIN` to your Vercel frontend URL.
- Do not commit `.env` or credentials.

## AI coding tools
This starter was generated with ChatGPT assistance. Review and understand the code, test the flow, and describe accurately which tools you personally used before submitting.

## With more time
- Add host authentication, overlapping-time checks (currently only identical start times are blocked), timezone selection, email confirmations, and automated tests.

## Known scope limits
- One host, one timezone, no authentication. Host dashboard is publicly accessible by design for this challenge.
- No external AI API or Google Calendar integration included.
- Slots are checked against server-local time; set server timezone consistently with the host timezone.
