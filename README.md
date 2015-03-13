Vinna
=====

* ~~Basic website (Who we are, link to Etsy shop, link to social media)~~ [https://vinna.herokuapp.com/](https://vinna.herokuapp.com/)
* Custom domain (vinna.us, https://help.github.com/articles/adding-a-cname-file-to-your-repository/)  
* ~~Basic blog (with access controls so that only Anna can create/edit/delete)
* ~~Ability for Anna to share stories from other blogs (articles)? http://guides.rubyonrails.org/getting_started.html - #6. Adding a second model~~
* Comments? Do we want comments? 
* Tags? Search bar? 

Add access levels:

user = User.find(9)
user.password = 'Test1234'
user.password_confirmation = 'Test1234'
user.access_level = 'admin'
user.save #=> true

