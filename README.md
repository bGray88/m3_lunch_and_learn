# README
## Lunch and Learn

<a name="readme-top"></a>

<details>
  <summary>Table of Contents</summary>
  <ul list-style-position="inside">
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#learning-goals">Learning Goals</a></li>
        <li><a href="#built-with">Built With</a></li>
        <li><a href="#roadmap">Roadmap</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li>
      <a href="#usage">Usage</a>
      <ul>
        <li><a href="#endpoints">Endpoints</a></li>
      </ul>
    </li>
    <li>
      <a href="#contributing">Contributing</a>
      <ul>
        <li><a href="#developers">Developers</a></li>
        <li><a href="#project-managers-instructors">Project Managers-Instructors</a></li>
      </ul>
    </li>
  </ol>
</details>

## About the Project

  ### Learning Goals

  * Microservice integration and implementation
  * Service integration and implementation
  * Efficient API consumption

  ### Built With

  [![Ruby]][Ruby-url] [![Rails]][Rails-url][![Postgres]][Postgres-url] [![Postman]][Postman-url]

  ### Roadmap
  <details>
    <summary>Done</summary>
    - [x] Add Readme<br>
    - [x] Readme: Outlines the learning goals<br>
    - [x] Readme: Add back to top links<br>
    - [x] Readme: Clone and Setup<br>
    - [x] Readme: Users Get API keys<br>
    - [x] Readme: Happy Path Endpoint Use<br>
    - [x] Setup Repo and Push to Github<br>
    - [x] Endpoint: Recipes-Happy, Sad<br>
    - [x] Endpoint: Learning_Resources-Happy, Sad<br>
    - [x] Endpoint: Users-Happy, Sad<br>
    - [x] Endpoint: Favorites-Happy, Sad<br>
    - [x] Extension: Validate_Country<br>
  </details>
  <details>
    <summary>In Progress</summary>
    - [ ] Extension: Favorite-Delete<br>
    - [ ] Extension: Caching/Backgorund_Workers<br>
    - [ ] Extension: Authentication<br>
  </details>

  <!-- ### Issues

  See the [open issues](https://github.com/bGray88/m3_lunch_and_learn/issues) for a full list of proposed features (and known issues). -->

  <p align="right">(<a href="#readme-top">back to top</a>)</p>

## Getting Started

  ### Prerequisites

  * Ruby 2.7.4
  * Rails 5.2.8

  #### API Keys Required:

  ```sh
  Edamam APP_ID
  Edamam APP_KEY
  YouTube API_KEY
  Unsplash CLIENT_ID
  Places API_KEY
  ```

  ### Installation

  _Below are instructions for forking and cloning this repo_

  1. Clone the repo
  ```sh
  git clone git@github.com:bGray88/m3_lunch_and_learn.git
  ```
  2. Install gems
  ```sh
  bundle install
  ```
  3. Setup the database
  ```js
  rails db:{create,migrate}
  ```
  4. Run RSpec tests
  ```sh
  bundle exec rspec
  ```

  <p align="right">(<a href="#readme-top">back to top</a>)</p>

## Usage

  ### Endpoints

  - Root directory: 'http://localhost:3000'
  - Try it now: <br>
  'http://localhost:3000/api/v1/recipes?country=russia'<br>
  'http://localhost:3000/api/v1/learning_resources?country=laos'<br>

  - /recipes
  - Recipes by country
    - GET recipes?country="country"
      - Returns a list of recipes related to the country sent
      ![alt text](app/assets/images/readme_recipes_cntry_get.png)

  - /learning_resources
  - Learning Resources for country
    - GET learning_resources?country="country"
      - Returns a collection of a single video and 10 images related to the country sent
      ![alt text](app/assets/images/readme_learningresources_cntry_get.png)
  
  - /users
  - Users for experience
    - POST register
      - Returns a created user
      ![alt text](app/assets/images/readme_users_post.png)

  - /favorites
  - Favorites for user integration with resources
    - POST favorites
      - Returns a status message and joins user to favorite
      ![alt text](app/assets/images/readme_favorites_post.png)
  
  - /favorites
  - Favorites for user integration with resources
    - GET favorites
      - Returns a list of user favorites
      ![alt text](app/assets/images/readme_favorites_get.png)

  <p align="right">(<a href="#readme-top">back to top</a>)</p>

## Contributing

  Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

  If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
  Don't forget to give the project a star! Thanks again!

  1. Fork the Project
  2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
  3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
  4. Push to the Branch (`git push origin feature/AmazingFeature`)
  5. Open a Pull Request

  ### Developers

  <div align="center">
    <img src="https://avatars.githubusercontent.com/u/111726505?s=400&u=30c6a5c91b611750a32a1a07dc1da834684dffa1&v=4" alt="Profile" width="80" height="80">
    <p align="center">
      Brandon Gray<br>
      <a href="https://github.com/bGray88">Github: bGray88</a>
    </p>
  </div>

  Project Links: <br> 
  [Github](https://github.com/bGray88/m3_lunch_and_learn) <br>

  <p align="right">(<a href="#readme-top">back to top</a>)</p>

  ### Project Managers-Instructors

  1. Meg Stang
  2. Mike Dao
  3. Brian Zanti

  <p align="right">(<a href="#readme-top">back to top</a>)</p>

  ## Acknowledgments

* [Edamam](https://www.edamam.com/): Leading provider of nutrition data and analytics
* [REST Country](https://restcountries.com/): Country Information
* [YouTube](https://www.youtube.com/): Lose yourself in cat videos
* [Places](https://developers.google.com/maps/documentation/places/web-service): Get location data for over 200 million places, and add place details, search, and autocomplete to your apps
* [Unsplash](https://unsplash.com/): Beautiful, free images and photos that you can download and use for any project. Better than any royalty free or stock photos.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

[Ruby]: https://img.shields.io/badge/-Ruby-CC342D?style=flat&logo=ruby&logoColor=white
[Ruby-url]: https://www.ruby-lang.org/en/
[Rails]: https://img.shields.io/badge/-Ruby%20on%20Rails-CC0000?style=flat&logo=rubyonrails&logoColor=white
[Rails-url]: https://rubyonrails.org
[Postgres]: https://img.shields.io/badge/-Postgres-4169E1?style=flat&logo=postgresql&logoColor=white
[Postgres-url]: https://www.postgresql.org/
[Postman]: https://img.shields.io/badge/-Postman-FF6C37?style=flat&logo=postman&logoColor=white
[Postman-url]: https://www.postman.com/