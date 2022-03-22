select sum(c_acctbal) as acctbal
from {{ref('playing_with_tests')}}
having sum(c_acctbal) < 100000000