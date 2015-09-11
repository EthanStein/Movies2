class MovieData
  attr_reader :u, :m, :k
  def initialize(u, m, k, movie_data)
    @u = Hash.new
    @m = Hash.new
    @k = Hash.new
    @movie_data = []
  end

  def load_data()
    prompt = '> '
    puts "Hi! Which file would you like to open?", prompt
    #We prompted the user to give us what file to open and called it file_name
    file_name = $stdin.gets.chomp
    #making a "file object
    file = open(file_name)
    #create a block that takes a parameter
    file.each do|line|
      # #splits the line at tab character into row Array
      #http://stackoverflow.com/questions/20807484/why-is-my-ruby-script-not-splitting-the-field-in-my-csv
        single_line = line.chomp.split("\t")
      #line_info is an hash with each of the four piece of information in each line from file
        line_info = {'user_id' => single_line[0], 'movie_id' => single_line[1], 'rating' => single_line[2],
          'timestamp' => single_line[3]}
        @movie_data.push(line_info)
      end

  #returns the rating that user u gave movie m in the training set, and 0 if user u did not rate movie m'
  def rating(file, u,m)
=begin  file.each do |movie, rating|
      if rating == 0
        return file[movie], "0"
      else
        return file[movie], file[rating]
      end
    end
  end
=end
@u[user_id].rating(movie_id)


  def predict(u,m)

    return @u[user_id].average
    #returns a floating point number between 1.0 and 5.0 as an estimate of what user u would rate movie m'
  end

  #returns the array of movies that user u has watched
  def movies(file, u)
    return  @u[user_id].user_id.movie_id
  end

#returns the array of users that have seen movie m
  def viewers(file,m)
  return  @m[movie_id].user_id.rating
  end


  def run_test(k)
    puts runs the z.predict method on the first k ratings in the test set and
    return MovieTest
  end

end


class MovieTest
  attr_reader :u, :m, :k
  def initialize(u, m, k, movie_data)
    @u = u
    @m = m
    @k = k
    @movie_data = []
  end

  def mean (array)
    #To calculate the standard deviation we work out the mean.
    array.inject(array.inject(0)) {|sum, z| sum = sum + z } / array.size.to_f
  end

  def squared_differences
    #We work out the mean of those squared differences
    #For each number subtract the Mean and square the result.
    x = array.mean
    sum = array.inject(0){|x, mean| (x-mean)*(x-mean)}
    sum/(array.length -1).to_f
   end

  end

  def stddev
    #Take the square root of that.
     return Math.sqrt(array.squared_differences)
  end

  def rms (z.predict)
    Math.sqrt(z.predict)
  end

  def to_a
    prediction_array = [u, m, r, p]
    return prediction_array
  end

  z = MovieData.new("ml-100k")
  z = MovieTest.new("ml-100k")
