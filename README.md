# Conference Schedule

A small SQL project from Codecademy's Full-Stack Engineer path. The idea is that I'm helping organize a tech conference, and the planning team needs a simple database to keep track of the talks: who's speaking, what the talk is called, what day it's on, and which room it's in.

There's no live site for this one. It's a single SQL file that runs on SQLite.

## What it does

The script builds a `sessions` table and walks through how a schedule changes over time:

- Creates the table with an id, title, speaker, and date for each talk
- Adds three talks for May 1 to 3, 2026
- Renames Jordan Patal's talk after he sent an updated title
- Pulls up just the title of Jordan's talk
- Adds a `room` column once rooms needed to be assigned
- Puts each talk in Room A, B, or C
- Removes Elena Rivera's talk after she canceled
- Shows the final schedule

## How to run it

You need the SQLite command line tool. On Windows you can install it with:

```
winget install SQLite.SQLite
```

Then from this folder:

```
sqlite3 -header -column :memory: ".read conference_schedule.sql"
```

`:memory:` runs everything in a temporary database, so you can run it as many times as you want and always start fresh.

## Example output

Jordan's updated title:

```
           title
---------------------------
Building Reliable REST APIs
```

Final schedule:

```
id             title               speaker     session_date  room
--  ---------------------------  ------------  ------------  ----
 1  Intro to Data Visualization  Maya Chen     2026-05-01    A
 2  Building Reliable REST APIs  Jordan Patal  2026-05-02    B
```

## What I learned

- I first made `room` an INTEGER because the task said room numbers. Then the rooms turned out to be A, B, and C, so I switched it to TEXT.
- For the UPDATE and DELETE statements I matched on `id` instead of the speaker's name. The id always points to exactly one row, so there's no chance of changing or deleting more than I meant to.
- Without a WHERE clause, UPDATE and DELETE hit every row in the table. That made me slow down and double check every one.
- Codecademy runs the whole file again on a fresh database every time you save. That's why the CREATE TABLE never errored out the second time.

Built by DeVante Bush
