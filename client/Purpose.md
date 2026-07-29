# Capstonic – Capstone Management System

## Overview

Capstonic is a web-based Capstone Management System built specifically for schools that manage student graduation projects.

Its purpose is to replace spreadsheets, emails, WhatsApp groups, and disconnected workflows with one centralized platform that manages the complete capstone lifecycle.

This is **not** a generic project management application like Jira, Trello, or ClickUp.

It is an **academic operations platform** designed around how schools run capstone projects.

---

# The Problem

Most schools manage capstone projects using multiple disconnected tools:

- Excel sheets
- Google Forms
- Emails
- WhatsApp groups
- Paper submissions
- Manual grading

This creates problems such as:

- Missing deadlines
- Lost submissions
- No project visibility
- Difficult communication
- Manual progress tracking
- Inconsistent grading
- No analytics

Capstonic solves this by becoming the single source of truth for every stakeholder.

---

# Goals

The platform should allow schools to:

- Manage every capstone team
- Assign supervisors
- Organize projects into milestones (sprints)
- Track progress
- Review submissions
- Give feedback
- Grade projects
- Monitor deadlines
- Generate analytics
- Provide dashboards for every role

---

# Core Philosophy

The system should feel like a modern SaaS product rather than a traditional school management system.

Think of it as a mix of:

- GitHub Issues
- Linear
- Notion
- Jira
- ClickUp

…but redesigned specifically for education.

The experience should focus on:

- Simplicity
- Fast navigation
- Minimal clutter
- Clear hierarchy
- Excellent UX
- Dashboard-first design

---

# Users

The system has multiple user roles.

## Student

Students primarily consume tasks.

They should be able to:

- View their team
- View their supervisor
- See upcoming deadlines
- View milestones
- Open assigned issues/tasks
- Submit deliverables
- View engineer feedback
- Track project completion
- View grades

---

## Engineer (Supervisor)

Engineers supervise multiple teams.

They can:

- Review submissions
- Approve work
- Reject work
- Leave feedback
- Create tasks
- Manage assigned teams
- Monitor deadlines
- Track team progress

---

## Teacher

Teachers oversee classroom progress.

They should be able to:

- Monitor teams
- View submissions
- Track attendance to milestones
- View grades
- Follow project progress

---

## Capstone Lead

Capstone Leads manage the academic workflow.

Responsibilities include:

- Create milestones
- Plan sprints
- Assign issues
- Monitor every team
- Track completion
- Review engineer workload
- Identify struggling teams

---

## Staff Admin

Responsible for managing school operations.

They manage:

- Users
- Teams
- Classes
- Grades
- Departments
- Engineer assignments
- Permissions

---

## Super Admin

Complete control over the platform.

Can configure:

- Roles
- System settings
- Academic years
- Permissions
- Global data

---

## Board Member

Executive-level user.

They don't manage projects directly.

Instead they receive dashboards showing:

- Overall completion
- Submission statistics
- Grade distribution
- Team performance
- Engineer workload
- School-wide analytics

---

# Workflow

The platform follows the lifecycle below.

```
Admin
    ↓
Create users
    ↓
Create teams
    ↓
Assign engineers
    ↓
Capstone Lead creates milestones
    ↓
Create issues/tasks
    ↓
Assign tasks to teams
    ↓
Students work
    ↓
Students submit deliverables
    ↓
Engineer reviews
        ↓
 Approved? ─── Yes ──► Closed
        │
       No
        │
Request revisions
        │
Students resubmit
```

---

# Milestones

The system follows an Agile-inspired workflow.

A milestone represents a sprint or major project goal.

Example:

Sprint 1
- Research
- Problem Statement
- Solution Validation

Sprint 2
- UI Design
- Database
- Backend

Sprint 3
- Frontend
- Integration
- Testing

Every issue belongs to exactly one milestone.

Milestones track overall sprint completion.

---

# Issues

The system uses an issue-based workflow similar to GitHub.

Each issue contains:

- Title
- Description
- Status
- Priority
- Assignee
- Team
- Milestone
- Due date
- Attachments
- Comments
- Submission
- Review history

Statuses include:

- Open
- In Progress
- Submitted
- Reopened
- Closed

---

# Submissions

Students can submit:

- Documents
- PDFs
- GitHub repositories
- Figma links
- Presentations
- Images
- Videos
- External URLs

Engineers review submissions before approval.

---

# Dashboard Philosophy

Every role has its own dashboard.

Students should immediately see:

- Today's work
- Deadlines
- Assigned issues
- Progress
- Feedback

Engineers should immediately see:

- Teams needing review
- Pending submissions
- Late teams
- Upcoming deadlines

Admins should immediately see:

- School health
- Active users
- Team statistics
- Completion percentages

Board members should immediately see:

- Executive KPIs
- Charts
- Trends
- Performance summaries

---

# Design Language

The UI should be inspired by modern SaaS products.

Characteristics:

- Large spacing
- Rounded cards
- Clean typography
- Minimal colour usage
- Information-first layouts
- Strong visual hierarchy
- Responsive
- Fast
- Professional

Avoid making it feel like:

- Moodle
- Blackboard
- Traditional school portals
- Government software

---

# Modules

The system consists of the following major modules.

- Dashboard
- Projects
- Teams
- Milestones
- Issues
- Reviews
- Submissions
- Analytics
- Users
- Administration
- Settings

Each role only sees the modules they are authorised to access.

---

# Technical Vision

The frontend should be designed as if it will eventually communicate with a REST API.

UI should assume:

- Authentication
- Role-based permissions
- Pagination
- Filtering
- Search
- Sorting
- Notifications
- Dark/Light mode
- Responsive layouts

Even if backend functionality is mocked during development, the interface should be built with production-quality architecture in mind.

---

# Project Vision

Capstonic aims to become the central operating system for a school's capstone programme.

The platform should make managing hundreds of teams feel effortless while providing every stakeholder with exactly the information they need—no more, no less.

The result should feel closer to a polished commercial SaaS product than a traditional educational portal.