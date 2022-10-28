Realised simple currency converter with fixer.io

![Screenshot from 2022-10-28 20-12-05](https://user-images.githubusercontent.com/102487287/198694353-4eca9d71-e5fe-47b0-9582-a97dc14eae9b.png)

On the main page, you need to select the currency to be converted and the currency to be converted.
This was realised wuth a "select_tag". You can choose "USD", "EUR", "GBP", "UAH".
You should input amount of a currency and date for actual currency rate. If date field is empty you will got a today`s currency rate.
After that params are posted to another controller`s action 'exchange'. On a main page realised a chart of daily rates of USD/UAH currency. It was realised with gem "chartkick" and have next realisation:
![Screenshot from 2022-10-28 20-32-18](https://user-images.githubusercontent.com/102487287/198697730-515d8060-99c4-4a75-b66e-6ea18e5bafae.png)
Gem takes :created_at and :rate from our database model "UahRate". Our model if filing once per day with a cron tasks. It was realised with gem 'sidekiq' and a gem "sidekiq-cron". Fot styles was used gem 'bootstrap'. Code of cron-job that create our daily rates:![Screenshot from 2022-10-28 20-44-31](https://user-images.githubusercontent.com/102487287/198699661-e0aeb524-2eac-40ed-a42c-d54f749b0385.png)

With a cron schedule.yml file:
![Screenshot from 2022-10-28 20-45-24](https://user-images.githubusercontent.com/102487287/198699784-ff5c5e1f-6a8f-428e-8901-b1f428dfc550.png)




Here we got all our calculations and asking a Fixer.io for a help with a service file - "currency_exchanger.rb"

Service file at the beginning load .env file, that is ignored in Git because we have our API_KEY there. We use gem 'dotenv' for this.
We have a possability that user will sand our params without DATE, thet`s why realised usind 2 links to API.
![Screenshot from 2022-10-28 20-24-12](https://user-images.githubusercontent.com/102487287/198696394-768982c9-4111-43ba-959c-e8a24bcb90bf.png)

User our .env file with API_KEY for building a header for request to fixer.io.
![Screenshot from 2022-10-28 20-26-11](https://user-images.githubusercontent.com/102487287/198696768-cbf7890d-f804-48e2-9418-4e108ce2d120.png)

After ther we create a request to API with a rescue of ERRORS (for exampple: code 404. Unauthorised user):
![Screenshot from 2022-10-28 20-27-05](https://user-images.githubusercontent.com/102487287/198696969-877a369e-63e9-49cb-81c3-72b546464709.png)
Connection to API was realised with gem 'rest-client'.

After acception of a calculation on a homepage and success you will have next page:
![Screenshot from 2022-10-28 20-37-57](https://user-images.githubusercontent.com/102487287/198698731-7e237303-ae03-4755-8cfd-4a29f185d0d9.png)
And you will see next when Error is rescued:
![Screenshot from 2022-10-28 20-42-12](https://user-images.githubusercontent.com/102487287/198699282-2ed311ce-b67a-44f3-b33b-f31e2224276d.png)


