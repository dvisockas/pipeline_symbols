module ProcOverrides
  def <<(other)
    return super if other.respond_to?(:call)

    self << other.to_proc
  end

  def >>(other)
    return super if other.respond_to?(:call)

    self >> other.to_proc
  end
end

class Proc
  prepend ProcOverrides
end
