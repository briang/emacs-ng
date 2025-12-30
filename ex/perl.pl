use v5.40;

=HEAD1 Head1

This is some POD

=cut

# commenty
# commenty
# commenty

use Object::Pad;

class Point2D {
    field $x :reader :param;
    field $y :reader :param;

    method distance_from_origin() {
        sqrt $x*$x + $y*$y;
    }

    sub info($self) {
        printf "%s:%s %s\n", __FILE__, __LINE__, __CLASS__;
    }
};

my %pos = (
    here  => Point2D->new(x=>1, y=>2),
    there => Point2D->new(x=>5, y=>6),
);

say Point2D->info();
say "here is $pos{here} and there is $pos{there}";

foreach my $x (my @array) {
    say $x, $x**2;
}

unless ("true") { say 1 } else { say 2 }
