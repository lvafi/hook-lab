# README

In this lab we will add vaildation to product model.

product.rb


product.errors.messages

###Step 1:

In console try to create product duplicate product like this :

rails-console>product=Product.create({title:'Apple',description:'Fresh Apple',price:5.0})

If it doesnot allow you to create product, use following to see validation errors

product.errors.messages

#Lab: Product model callbacks


We will update the model Product.rb as shown in solution

We will test by creating product in rails console like this:

product=Product.create({title:"banana-1",description:"Healthy Fruit"})

But it will create a product with capitalize title and price = 1.0 like this:

<Product id: 1003, title: "Banana-1", description: "Healthy Fruit", price: 1.0, created_at: "2019-10-22 16:29:46", updated_at: "2019-10-22 16:29:46">

#Product model custom methods

Where created a scope, similar to arrow functions in node which searches a word in title, example in rails console:

Product.search('apple')

#CRUD: New and Create

$>rails g controller Products new create 

Here g is the sugar syntax of generate.
Note: Contoller should be always in plural form like: Products