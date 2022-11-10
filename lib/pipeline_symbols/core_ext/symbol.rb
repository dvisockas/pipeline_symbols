class Symbol
  def <<(other)
    to_proc << Proc.new(&to_callable(other))
  end

  def >>(other)
    to_proc >> Proc.new(&to_callable(other))
  end

  private

  def to_callable(other)
    other.respond_to?(:call) ? other : Proc.new(&other)
  end
end
