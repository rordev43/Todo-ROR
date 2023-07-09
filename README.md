​
# Local Development Setup
​
## Technology stack
​
- Ruby 3.0.6
- Ruby on Rails 7.0.6
- Application Server: Puma
- Component Library from Tailwind + Flowbite https://flowbite.com/docs/getting-started/introduction/
​
​
### Requirements
​
Before you get started, the following needs to be installed:
  * **Ruby**. Version 3.0.6 is currently used and we don't guarantee everything works with other versions. If you need multiple versions of Ruby, [RVM](https://rvm.io//) or [rbenv](https://github.com/rbenv/rbenv) is recommended.
  * **Bundler**: `gem install bundler`
  * [**Git**](http://help.github.com/git-installation-redirect)
  * **A database**. Sqlite3 which is default database comes with rails is being used for this application:
### Setting up the development environment
​
1.  Get the code. Clone this git repository and check out the latest release:
​
    ```bash
    git clone https://github.com/
    cd TODO-APP
    ```
​
2.  Install the required gems by running the following command in the project root directory:
​
    ```bash
    bundle install
    ```
​
3.  Setup tailwind by running the commands from your root of application:
    ```bash
    npm install -D tailwindcss
    ```

    ```bash
    npx tailwindcss init
    ```

    ```bash
    npx tailwindcss -i app/assets/stylesheets/application.css -o app/assets/stylesheets/wind.css --watch
    ```
   
5.  Create and populate database with seeds using:
    ```
    rails db:create db:migrate db:seed
    ```
​
6.  Run server:
​
    `rails server` or `rails s`
​
Congratulations! ToDo App should now be up and running for development purposes on http://localhost:3000/