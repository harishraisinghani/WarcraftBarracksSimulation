#!/bin/bash
for i in `seq 1 9`
do
  bundle exec rspec spec/test_0$i.rb
done

for i in `seq 0 9`
do 
  bundle exec rspec spec/test_1$i.rb
done