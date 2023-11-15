# Lunch and Learn

A project that has a user to create an account to search foods by country, favorite recipies they find, and see a little about the country chosen.

## Learning Goals

- Expose an API that aggregates data from multiple external APIs
- Expose an API that requires an authentication token
- Implement Basic Authentication
- Expose an API for CRUD functionality
- Determine completion criteria based on the needs of other developers
- Test both API consumption and exposure, making use of VCR

## Setup
Created using Ruby 3.2.2 and Rails 7.1.1 <br>

Run: <br>
- bundle install <br>
- rails db:{drop,create,migrate,seed} <br>

A user must have a Name, Email, Password, and an API Key

### Edamam

To utilize [Edamam API](https://developer.edamam.com/edamam-recipe-api). Sign up to create an application and collect the application id and API key.

### REST Countries

[REST Countries API](https://restcountries.com/#api-endpoints-v3-all) does not have a key or other requirements.

### Youtube

To use the [Youtube API](https://developers.google.com/youtube/v3/docs/search/list). This will give you the steps to register a program and get the needed API key.

### Unsplash

To call [Unsplash](https://unsplash.com/developers). Sign up as a developer to recieve and API key.

## Endpoints

### Get Recipes For a Country

Request:
```
GET /api/v1/recipes?country=ENTER COUNTRY HERE
```
   - Enter a country to recieve recipes for that country

Regular Response:

```
{
  "data": [
    {
      "id": null,
      "type": "recipe",
      "attributes": {
        "title": "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)",
        "url": "https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html",
        "country": "thailand",
        "image": "https://edamam-product-images.s3.amazonaws.com/web-img/611/..."
      }
    }
  ]
}
```

### Get Learning Resources for a Country
Request:
```
GET /api/v1/learning_resources?country=ENTER COUNTRY HERE
```

Response:
```
  {
    "data": {
      "id": null,
      "type": "learning_resource",
      "attributes": {
        "country": "laos",
        "video": {
          "title": "A Super Quick History of Laos",
          "youtube_video_id": "uw8hjVqxMXw
        },
        "images": [
          {
            "alt_tag": "The picture taken in Laos, 06:00, from hot baloon",
            "url": "https://images.unsplash.com/photo-1540611025311-01df3cef54b5?ixid=M3w1MjczNzZ8MHwxfHNlYXJjaHwxfHxsYW9zfGVufDB8fHx8MTY5OTg0NzUwN3ww&ixlib=rb-4.0.3"
          },
          {...},
          {...}
        ]
      }
    }
  }
```

### Users
Request:
```
POST /api/v1/users

body (json):
{
  "name": "user",
  "email": "user@gmail.com",
  "password": "1234",
  "password_confirmation": "1234"
}
```

Response:
```
  {
    "data": {
      "type": "user",
      "id": "1",
      "attributes": {
        "name": "user",
        "email": "user@gmail.com",
        "api_key": "1234"
      }
    }
  }
```

### Login
Request:
```
POST /api/v1/sessions

body (json):
{
  "email": "user@gmail.com.com",
  "password": "1234"
}
```

Response
```
  {
    "data": {
      "type": "user",
      "id": "1",
      "attributes": {
        "name": "user",
        "email": "user@gmail.com",
        "api_key": "1234"
      }
    }
  }
```

### Add and Receive Favorites
Adding Favorites
Request:
```
POST /api/v1/favorites

body (json):
{
  "api_key": "1234",
  "country": "thailand",
  "recipe_link": "https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html",
  "recipe_title": "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)"
}
```

Response:
```
  {
    "success": "Favorite added successfully"
  }
```

Receiving Favorites
Request:
```
GET /api/v1/favorites?api_key=hdl129745hdkalckd9274
```

Response:
```
  {
    "data": [
      {
        "id": "1",
        "type": "favorite",
        "attributes": {
          "recipe_title": "recipe 1",
          "recipe_link": "https://recipe_link_1.com",
          "country": "country 1",
          "created_at": "2023-11-13T21:31:50.714Z"
        },
        {...},
        {...}
      }
    ]
  }
```

### Sad Path Responses
Response if Endpoint is Empty:
```
  {
    "data": []
  }
```

Error Response for any Endpoints
```
  {
    "errors": [
      {
        "status": "400",
        "title": "ERROR MESSAGE DEPENDING ON ERROR ISSUE"
      }
    ]
  }
```
