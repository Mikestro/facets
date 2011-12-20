class Array

  # Returns the percentile value for percentile _pcnt_; nil if array is empty.
  #
  # +pcnt+ should be expressed as an integer, e.g. `percentile(90)` returns
  # the 90th percentile of the array.
  #
  # Algorithm from NIST[http://www.itl.nist.gov/div898/handbook/prc/section2/prc252.htm]
  #
  # NOTE: This is not a common core extension and is not
  # loaded automatically when using <code>require 'facets'</code>.
  #
  # CREDIT: Ben Koski
  #
  # @non-core
  #   require 'facets/array/op_pow'
  #
  def percentile(pcnt)
    sorted_array = self.sort

    return nil if self.length == 0

    rank  = (pcnt.to_f / 100) * (self.length + 1)
    whole = rank.truncate
 
    # if has fractional part
    if whole != rank
      s0 = sorted_array[whole - 1]
      s1 = sorted_array[whole]

      f = (rank - rank.truncate).abs

      return (f * (s1 - s0)) + s0
    else
      return sorted_array[whole - 1]
    end    
  end
  
end
