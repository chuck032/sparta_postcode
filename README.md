# sparta_postcode

## Instructions for use:

* git clone the file down to your repository
* cd into the directory
* gem install rspec
* gem install httparty
* to check tests are working run the command "rspec" in your terminal
* to see the code open the files inside a text editor of your choice

## Aims

The aims of this project were to write tests using rspec and ruby, whilst using postcodes to generate data. Then using HTTParty and ruby methods to abstract information to test.
I tested both single postcodes and multiple postcodes.
These are the following things I tested:

* Status message
* data type of Results 
  within Results hash:
  * length of postcode
  * Quality data type
  * Eastings data type
  * Country, correct countries within UK
  * NHS authority data type
  * Longitude data type
  * Latitude data type
  * Paliamentary consituency data type
  * Region data type
  * Parish data type
  * Lsoa data type
  * Msoa data type
  * Admin district data type
  * Incode, length 
  
I created tests and methods for these test topics for both single and multiple postcodes.
  
