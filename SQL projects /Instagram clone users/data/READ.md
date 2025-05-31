# Instagram Clone User Data Analysis
## The project:
In this project, I have generated various datasets based on a clone of the popular photo-sharing app Instagram, including those of users, photos, likes, follows, comments, tags etc. This project can help in identifying:
- user activity
- a schedule for an ad campaign
- trending hashatags for targeted marketing by consumer brands
- a reward system for old and loyal users
  and more.

  ### The Dataset:
  This dataset contains-
  
### Users Table:

|	Column	|	Description	|
|---------------|-----------------------|
|	id	|	Unique user ID	|
|	username	|	Unique username	|
|	created_at	|	Date and time the account was created	|

### Photos Table:

|	Column	|	Description	|
|---------------|-----------------------|
|	id	|	Unique photo ID	|
|	image_url	| Link of the photo	|
|	user_id	|	ID of the user who uploaded the photo|
|	created_at	|	Date and time the photo was uploaded	|

### Comments Table:

|	Column	|	Description	|
|---------------|-----------------------|
|	id	|	Unique comments ID	|
|	comment_text	| The text of the comment itself	|
|	user_id	|	ID of the user who commented	|
|	photo_id	|	ID of the photo the comment was made on	|
|	created_at	|	Date and time the comment was made	|

### Likes Table:

|	Column	|	Description	|
|---------------|-----------------------|
|	user_id	|	ID of the user who liked	|
|	photo_id	| ID of the photo liked	|	
|	created_at	| Date and time of like	|

### Follows Table:

|	Column	|	Description	|
|---------------|-----------------------|
|	follower_id	| ID of the user who is following	|
|	followee_id	| ID of the user who is being followed	|
|	created_at	| Date and time the user was followed	|

### Tags Table:

|	Column	|	Description	|
|---------------|-----------------------|
|	id	| Unique tag ID	|
|	tag_name	|	Name of the hashtag	|
|	created_at	|	Date and time the tag was created	|
