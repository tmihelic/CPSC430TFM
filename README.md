CPSC430TFM
==========

Database Information:

farmers.db

  locations
      pkey: varchar(5)
      siteName: varchar(30)
      
  users
      pkey: int
      username: varchar(30)
      password: varchar(30)
      
  customer
      pkey: int
      username: varchar(30)
      demographics: int
      
  custDemo
      pkey: int
      gender: varchar(6)
      age: varchar(3)
      ethnicity: varchar(10)
      snap: int
      zipCode: varchar(5)
      freq: varchar(8)
      found: varchar(15)
      tokens: real
      bTokens: varchar(3)
      
      
.csv File Names:

    locations.csv
    customers.csv
    customerDemographics.csv
