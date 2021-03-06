package Manoc::DB::Result::User;
# Copyright 2011 by the Manoc Team
#
# This library is free software. You can redistribute it and/or modify
# it under the same terms as Perl itself.

use base qw(DBIx::Class);

__PACKAGE__->load_components(qw(PK::Auto Core));

__PACKAGE__->table('users');
__PACKAGE__->add_columns(
			 id => {
			     data_type		=> 'integer',
			     is_nullable	=> 0,
			     is_auto_increment	=> 1,
			 },
			 login  => {
			     data_type		=> 'varchar',
			     size		=> 255,			     
			     is_nullable	=> 0
			     },
			 password  => {
			     data_type		=> 'varchar',
			     size		=> 255,
			     is_nullable	=> 0
			     },
			 fullname  => {
			     data_type		=> 'varchar',
			     size		=> 255,
			     is_nullable	=> 1
			     },
			 email  => {
			     data_type		=> 'varchar',
			     size		=> 255,
			     is_nullable	=> 1
			     },
			 active => {
			     data_type		=> 'integer',
			     size		=> 1,
			     is_nullable	=> 0,
			     default		=> 1,
			 }
			 );
__PACKAGE__->set_primary_key(qw(id));
__PACKAGE__->add_unique_constraint(['login']);

__PACKAGE__->has_many(map_user_role => 'Manoc::DB::Result::UserRole', 'user_id');
__PACKAGE__->many_to_many(roles => 'map_user_role', 'role');


=head1 NAME

Manoc:DB::User - A model object representing a person with access to the system.

=head1 DESCRIPTION

This is an object that represents a row in the 'users' table of your
application database.  It uses DBIx::Class (aka, DBIC) to do ORM.

=cut

1;
