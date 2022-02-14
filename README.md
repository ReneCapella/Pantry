# README

## Get the application up and running!

###  Install Rails:
- Rails 7.0.1
- Ruby ruby 3.0.1p64 (2021-04-05 revision 0fb782ee38) [x86_64-darwin20]
- Node v17.4.0

### Install the gems
 `bundle install`
### Create the db
`bundle exec rails db:create`
### Seed that db
`bundle exec rails db:seed`
### Start the app
`bundle exec rails s`
### Access the Rails console
`bundle exec rails c`

## Contribution Workflow
All work is written in a feature branch off of beta and submitted as a pull request pointing to beta
Before doing work, please message René at renecapella.dev@gmail.com to be added a contributor.

1. `git checkout main`
2. `git pull`
3. `git checkout beta`
4. `git pull`
5. `git checkout -b PANTRY-<issue number>`
6. Write your amazing code, make sure it passes lighthouse accessibility tests, make sure tests are passing, clean up debug and: `git add`, `git commit -m "PANTRY-<issue number> My detailed commit message here"`, `git push`
7. Open a pull request
8. Assign René to code review, add a detailed explanation of how test your feature, point to beta.
