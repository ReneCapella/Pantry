# Pantry
## The food planning application designed to support planning from production to consumer
According to the national nonprofit [ReFed](https://refed.org/about/who-we-are/#about-us), 
35% of food per year is not sold or eaten, and that while 11% makes it to donation or recycle purposes,
a whopping 54 tons (24%!) is completed unused and wasted.
### How does Pantry help solve this?
Pantry is a solution dedicated at improving food waste tracking, donation awareness, and informatics
for every level of the food supply chain: from producer to retailer to consumer.
### The Motivation
The United Nations has 17 Sustainability goals for our planet. #12 is
[Ensure sustainable consumption and production patterns](https://sdg-tracker.org/sustainable-consumption-production).
According to the U.N., "Sustainable consumption and production is about
promoting resource and energy efficiency, sustainable infrastructure, and providing
Its implementation helps to achieve overall development plans, reduce future economic,
environmental and social costs, strengthen economic competitiveness and reduce poverty."

The U.N. further lays out indicators and targets to achieve this goal:
- [Target 12.3](https://sdg-tracker.org/sustainable-consumption-production#12.3): Halve global per capita food waste
- [Target 12.5](): 
- [Target 12.6](https://sdg-tracker.org/sustainable-consumption-production#12.6): Encourage companies to adopt sustainable practices and sustainability reporting
- [Target 12.8](https://sdg-tracker.org/sustainable-consumption-production#12.8): Promote universal understanding of sustainable lifestyles
      
# Get the application up and running!
###  Install Rails:
- [Rails 7.0.1](https://guides.rubyonrails.org/getting_started.html)
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

# If you're running this locally:
You have some users:
username: basic@test.com
password: tester

username: producer@test.com
password: tester

Now, I do not have barcodes or qr codes for you, but I do have 10 orders, ids 1-10 that you can enter into the field on the add food page. You could also generate a qr code or bar code easily with one number 1-10 and scan the code to see that funcitonality.

The producer views are still in the works:) But you can see all your batches, choose one batch, edit that batch (and update the foor recall).

# Contribution Workflow
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
