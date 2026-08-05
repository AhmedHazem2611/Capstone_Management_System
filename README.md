# 🎓 Capstone Management System

A web-based platform for managing Capstone projects, tracking student team progress, assigning reviewing engineers, and managing capstone milestones.

---

# 🚀 Capstone Management System — Platform Update & Release Notes (v1.2.0)

## Executive Summary
This release delivers major enhancements across administrative oversight, student task visibility, visual progress metrics, and team assignment workflows. Highlights include an intuitive drag-and-drop staff assignment interface, synchronized completion progress bars, multi-criteria filtering, and fully integrated backend database updates for project management.

---

## 📊 1. Teams Overview & Team Profile
* **Advanced Engineer Filtering**: Introduced dedicated filter controls allowing administrators to filter teams by assigned engineer or easily isolate teams with **no assigned engineers**.
* **Visual Progress Tracking**: Integrated dynamic task completion progress bars directly onto team cards for rapid status auditing.
* **Assigned Staff Indicators**: Displayed assigned engineer names prominently on team cards for enhanced readability during filtered views.
* **Grade & Class Formatting**: Resolved display bugs to ensure accurate grade and class labels across all team cards.
* **Interactive Team Profile Management**: Authorized users can now edit project identity, bilingual names, and descriptions directly within the Team Profile view, featuring auto-expanding text fields and immediate header synchronization.

---

## 📈 2. Teams Progress
* **Engineer-Based Filtering**: Added filtering by assigned engineers (including unassigned teams) to streamline cohort performance tracking.
* **Synchronized Progress Bar**: Implemented real-time task completion progress bars across team cards.
* **Staff Visibility**: Added explicit engineer listings directly to progress cards for seamless cross-referencing.

---

## 📋 3. Teams Tasks
* **Weekly Completion Benchmarks**: Added dynamic progress bars for each week showing the exact percentage and count of teams that completed weekly milestones, with full responsiveness to grade filters.
* **Clutter-Free Card Architecture**: Redesigned task cards into an organized, color-coded layout that minimizes clutter while preserving critical task details.

---

## 🛠️ 4. Engineers Tasks
* **Organized Task Presentation**: Refactored task cards into a structured, color-coded hierarchy, improving scanability and reducing visual noise for reviewing engineers.

---

## 👑 5. Capstone Management (Super Admin)
* **Drag-and-Drop Staff Assignment**: Re-architected the *"Assign Engineers & Reviewers"* step into a drag-and-drop workflow that automatically persists changes to the backend database in real time.
* **Navigation Polish**: Streamlined section navigation styling to ensure active step clarity without misleading status highlights.

---

## 📁 6. My Project (Student & Leader View)
* **Roster Integration**: Replaced the static preview module with a structured roster detailing **Team Members** (with leader badges), **Assigned Engineers**, and **Capstone Supervisors**.
* **Database Persistence**: Integrated real-time backend synchronization (`/Project/My`) for instant project updates and live header updates.

---

## 🎓 7. My Team Progress (Student Portal)
* **Team Leader & Submission Fix**: Resolved a critical type-matching and team-resolution issue so Team Leaders and members now have complete, accurate visibility into team task completion statuses and progress metrics.

---

## 🛠️ Repository Structure

- `client/`: React + Vite frontend application.
- `server/`: ASP.NET Core Web API backend.
