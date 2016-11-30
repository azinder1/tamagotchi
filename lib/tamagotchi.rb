class Tamagotchi
  @@tamagotchis = {}
  def initialize(name)
    @alive = true
    @name = name
    @food_level = 10
    @sleep_level = 10
    @activity_level = 10
    @food_time = Time.now.sec
    @sleep_time = Time.now.sec
    @activity_time = Time.now.sec
    @button_time = Time.now.sec
  end
  def countdown
    @@time_left > 0 ? @@time_left-=1 : @@time_left = 10
  end
  def name
    @name
  end
  def food_level
    @food_level
  end
  def sleep_level
    @sleep_level
  end
  def activity_level
    @activity_level
  end
  def set_food_level(level)
    if (@food_level <= 9) && (2 - (Time.now.sec - @button_time) <= 0 )
      @food_level+= level
      @button_time = Time.now.sec
      @food_time =  Time.now.sec
    end
  end
  def set_activity_level(level)
    if (@activity_level <= 5) && (2 - (Time.now.sec - @button_time) <= 0)
      @activity_level+= level
      @button_time = Time.now.sec
      @activity_time = Time.now.sec
    end
  end
  def set_sleep_level(level)
    if (@sleep_level <= 4) && (2 - (Time.now.sec - @button_time) <= 0 )
      @sleep_level+= level
      @button_time = Time.now.sec
      @sleep_time = Time.now.sec
    end
  end
  def is_alive?
    if @food_level <= 0 || @sleep_level <= 0 || @activity_level <= 0
      false
    else
      true
    end
  end
  def time_passes(time)
    @food_level = 10 - (Time.now.sec - @food_time + time).abs
    @sleep_level = 10 - (Time.now.sec - @sleep_time + time).abs
    @activity_level = 10 - (Time.now.sec - @activity_time + time).abs
  end
  def save_tamagotchi
    @@tamagotchis = {'name' => self}
  end
  def self.get_tamagotchi
    @@tamagotchis.fetch('name')
  end
  def timers
    [@food_level, @sleep_level, @activity_level]
  end
end
