package Manoc::DB::Result::Arp;
# Copyright 2011 by the Manoc Team
#
# This library is free software. You can redistribute it and/or modify
# it under the same terms as Perl itself.

use base 'DBIx::Class';
use strict;
use warnings;

__PACKAGE__->load_components(qw/ Core/);
__PACKAGE__->table('arp');


__PACKAGE__->add_columns(
			 'ipaddr' => {
			     data_type		=> 'varchar',
			     is_nullable	=> 0,
			     size		=> 15
			     },
			 'macaddr' => {
			     data_type		=> 'varchar',
			     is_nullable	=> 0,
			     size 		=> 17,
			     
			     },
			 'firstseen' => {
			     data_type		=> 'int',
			     is_nullable	=> 0,
			     size 		=> 11
			     },
			 'lastseen' => {
			     data_type		=> 'int',
			     default_value	=> 'NULL',
			     is_nullable	=> 1,
			     },
			 'vlan' => {
			     data_type		=> 'int',
			     default_value	=> 1,
			     is_nullable	=> 0,
			     size		=> 11
			     },
			 'archived' => {
			     data_type		=> 'int',
			     default_value	=> 0,
			     is_nullable	=> 0,
			     size		=> 1
			     },
			 );

__PACKAGE__->set_primary_key('ipaddr', 'macaddr', 'firstseen', 'vlan');


sub sqlt_deploy_hook {
    my ($self, $sqlt_schema) = @_;
    
    $sqlt_schema->add_index( name => 'idx_mac', fields => [ 'macaddr'] );
}

1;

#  __PACKAGE__->set_sql('archive',
#  		     q{
#  			 UPDATE __TABLE__ 
#  			 SET archived=1
#  			 WHERE archived=0 AND lastseen < ? 
#  		     });


