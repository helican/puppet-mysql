
node default{
# We want MySQL installed on our machine
# We want MySQL to be constantly running
class { '::mysql::server':
    # We want to set custom MySQL root password
    root_password    =&gt; 'our_custom_password_here',
    override_options =&gt; {
        'mysqld' =&gt; {
            # We want MySQL max connections to be set to max_connections
            'max_connections'   =&gt; '1024',
            # We want MySQL key_buffer_size set to 512M      
            'key_buffer_size'   =&gt; '512M'       
        }       
    }   
}
 
# We want want to create daily backups of all our MySQL databases
class { '::mysql::server::backup':
     backupuser     =&gt;  'user_used_for_backups',
     backuppassword     =&gt;  'our_custom_password_here',
     # We want to store those backups secure in custom folder
     backupdir  =&gt;  '/root/mysql_backup',
     backupdirmode  =&gt;  '700',  
     backupdirowner     =&gt;  'root',     
     backupdirgroup     =&gt;  'root',     
     # We want to retain 7 copies of our backups
     backuprotate   =&gt;  7,   
     # We want to archive those backups   
     backupcompress     =&gt;  true,
}

}
