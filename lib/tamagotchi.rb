class Tamagotchi
  @@tamagotchis = {}
  def initialize(name)
    @alive = true
    @name = name
    @food_level = 10
    @sleep_level = 10
    @activity_level = 10
    @food_time = Time.now.min
    @sleep_time = Time.now.min
    @activity_time = Time.now.min
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
    if @food_level <= 9
      @food_level+= level
    end
    @food_time =  Time.now.min
  end
  def set_activity_level(level)
    if @activity_level <= 5
      @activity_level+= level
    end
    @activity_time = Time.now.min
  end
  def set_sleep_level(level)
    if @sleep_level <= 4
      @sleep_level+= level
    end
    @sleep_time = Time.now.min
  end
  def is_alive?
    if @food_level <= 0 || @sleep_level <= 0 || @activity_level <= 0
      false
    else
      true
    end
  end
  def time_passes(time)
    @food_level = 10 - (Time.now.min - @food_time + time)
    @sleep_level = 10 - (Time.now.min - @sleep_time + time)
    @activity_level = 10 - (Time.now.min - @activity_time + time)
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
