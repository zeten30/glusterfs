/*
 * Copyright (c) 2012 Red Hat, Inc. <http://www.redhat.com>
 * This file is part of GlusterFS.
 *
 * This file is licensed to you under your choice of the GNU Lesser
 * General Public License, version 3 or any later version (LGPLv3 or
 * later), or the GNU General Public License, version 2 (GPLv2), in all
 * cases as published by the Free Software Foundation.
 */

#ifdef RPC_XDR
%#include "rpc-pragmas.h"
#endif
%#include "compat.h"
%#include "rpc-common-xdr.h"
%#include "glusterfs-fops.h"
%#include "glusterfs3-xdr.h"

/* FOPS */
struct gfx_common_rsp {
       int    op_ret;
       int    op_errno;
       gfx_dict xdata; /* Extra data */
};

struct gfx_common_iatt_rsp {
       int op_ret;
       int op_errno;
       gfx_dict xdata;
       gfx_iattx stat;
};

struct gfx_common_2iatt_rsp {
       int op_ret;
       int op_errno;
       gfx_dict xdata;
       gfx_iattx prestat;
       gfx_iattx poststat;
};

struct gfx_common_3iatt_rsp {
        int    op_ret;
        int    op_errno;
        gfx_dict xdata; /* Extra data */
        gfx_iattx stat;
        gfx_iattx preparent;
        gfx_iattx postparent;
};

struct gfx_fsetattr_req {
        opaque gfid[20];
        hyper        fd;
        gfx_iattx stbuf;
        int        valid;
        gfx_dict xdata; /* Extra data */
};

struct gfx_rchecksum_req {
        opaque gfid[20];
        hyper   fd;
        unsigned hyper  offset;
        unsigned int  len;
        gfx_dict xdata; /* Extra data */
};

struct gfx_icreate_req {
       opaque gfid[20];
       unsigned int mode;
       gfx_dict xdata;
};

struct gfx_namelink_req {
       opaque pargfid[20];
       string bname<>;
       gfx_dict xdata;
};

/* Define every fops */
/* Changes from Version 3:
  1. Dict has its own type instead of being opaque
  2. Iattx instead of iatt on wire
  3. gfid has 4 extra bytes so it can be used for future
*/
struct gfx_stat_req {
        opaque gfid[20];
        gfx_dict xdata;
};

struct gfx_readlink_req {
        opaque gfid[20];
        unsigned int   size;
        gfx_dict xdata; /* Extra data */
};

struct gfx_readlink_rsp {
        int    op_ret;
        int    op_errno;
        gfx_dict xdata; /* Extra data */
        gfx_iattx buf;
        string path<>; /* NULL terminated */
};

struct gfx_mknod_req {
        opaque  pargfid[20];
        u_quad_t dev;
        unsigned int mode;
        unsigned int umask;
        string     bname<>; /* NULL terminated */
        gfx_dict xdata; /* Extra data */
};

struct  gfx_mkdir_req {
        opaque  pargfid[20];
        unsigned int mode;
        unsigned int umask;
        string     bname<>; /* NULL terminated */
        gfx_dict xdata; /* Extra data */
};

struct gfx_unlink_req {
        opaque  pargfid[20];
        string     bname<>; /* NULL terminated */
        unsigned int xflags;
        gfx_dict xdata; /* Extra data */
};


struct gfx_rmdir_req {
        opaque  pargfid[20];
        int        xflags;
        string     bname<>; /* NULL terminated */
        gfx_dict xdata; /* Extra data */
};

struct gfx_symlink_req {
        opaque  pargfid[20];
        string     bname<>;
        unsigned int umask;
        string     linkname<>;
        gfx_dict xdata; /* Extra data */
};

struct  gfx_rename_req {
        opaque  oldgfid[20];
        opaque  newgfid[20];
        string       oldbname<>; /* NULL terminated */
        string       newbname<>; /* NULL terminated */
        gfx_dict xdata; /* Extra data */
};

struct   gfx_rename_rsp {
        int    op_ret;
        int    op_errno;
        gfx_dict xdata; /* Extra data */
        gfx_iattx stat;
        gfx_iattx preoldparent;
        gfx_iattx postoldparent;
        gfx_iattx prenewparent;
        gfx_iattx postnewparent;
};


 struct  gfx_link_req {
        opaque  oldgfid[20];
        opaque  newgfid[20];
        string       newbname<>;
        gfx_dict xdata; /* Extra data */
};

 struct   gfx_truncate_req {
        opaque gfid[20];
        u_quad_t offset;
        gfx_dict xdata; /* Extra data */
};

 struct   gfx_open_req {
        opaque gfid[20];
        unsigned int flags;
        gfx_dict xdata; /* Extra data */
};

struct   gfx_open_rsp {
        int    op_ret;
        int    op_errno;
        gfx_dict xdata; /* Extra data */
        quad_t fd;
};


 struct   gfx_read_req {
        opaque gfid[20];
        quad_t  fd;
        u_quad_t offset;
        unsigned int size;
        unsigned int flag;
        gfx_dict xdata; /* Extra data */
};
 struct  gfx_read_rsp {
        int    op_ret;
        int    op_errno;
        gfx_dict xdata; /* Extra data */
        gfx_iattx stat;
        unsigned int size;
} ;

struct   gfx_lookup_req {
        opaque gfid[20];
        opaque  pargfid[20];
        unsigned int flags;
        string     bname<>;
        gfx_dict xdata; /* Extra data */
};


 struct   gfx_write_req {
        opaque gfid[20];
        quad_t  fd;
        u_quad_t offset;
        unsigned int size;
        unsigned int flag;
        gfx_dict xdata; /* Extra data */
};

 struct gfx_statfs_req  {
        opaque gfid[20];
        gfx_dict xdata; /* Extra data */
}  ;
 struct gfx_statfs_rsp {
        int    op_ret;
        int    op_errno;
        gfx_dict xdata; /* Extra data */
        gf_statfs statfs;
}  ;

 struct gfx_lk_req {
        opaque gfid[20];
        int64_t         fd;
        unsigned int        cmd;
        unsigned int        type;
        gf_proto_flock flock;
        gfx_dict xdata; /* Extra data */
}  ;
 struct gfx_lk_rsp {
        int    op_ret;
        int    op_errno;
        gfx_dict xdata; /* Extra data */
        gf_proto_flock flock;
}  ;

struct gfx_lease_req {
        opaque gfid[20];
        gf_proto_lease lease;
        gfx_dict xdata; /* Extra data */
}  ;

struct gfx_lease_rsp {
        int    op_ret;
        int    op_errno;
        gfx_dict xdata; /* Extra data */
        gf_proto_lease lease;
}  ;

struct gfx_recall_lease_req {
        opaque       gfid[20];
        unsigned int lease_type;
        opaque       tid[16];
        gfx_dict xdata; /* Extra data */
}  ;

 struct gfx_inodelk_req {
        opaque gfid[20];
        unsigned int cmd;
        unsigned int type;
        gf_proto_flock flock;
        string     volume<>;
        gfx_dict xdata; /* Extra data */
}  ;

struct   gfx_finodelk_req {
        opaque gfid[20];
        quad_t  fd;
        unsigned int cmd;
        unsigned int type;
        gf_proto_flock flock;
        string volume<>;
        gfx_dict xdata; /* Extra data */
} ;


 struct gfx_flush_req {
        opaque gfid[20];
        quad_t  fd;
        gfx_dict xdata; /* Extra data */
}  ;


 struct gfx_fsync_req {
        opaque gfid[20];
        quad_t  fd;
        unsigned int data;
        gfx_dict xdata; /* Extra data */
}  ;

 struct gfx_setxattr_req {
        opaque gfid[20];
        unsigned int flags;
        gfx_dict dict;
        gfx_dict xdata; /* Extra data */
}  ;



 struct gfx_fsetxattr_req {
        opaque gfid[20];
        int64_t  fd;
        unsigned int flags;
        gfx_dict dict;
        gfx_dict xdata; /* Extra data */
}  ;



 struct gfx_xattrop_req {
        opaque gfid[20];
        unsigned int flags;
        gfx_dict dict;
        gfx_dict xdata; /* Extra data */
}  ;

 struct gfx_common_dict_rsp  {
        int    op_ret;
        int    op_errno;
        gfx_dict xdata; /* Extra data */
        gfx_dict dict;
}  ;


 struct gfx_fxattrop_req {
        opaque gfid[20];
        quad_t  fd;
        unsigned int flags;
        gfx_dict dict;
        gfx_dict xdata; /* Extra data */
}  ;

 struct gfx_getxattr_req  {
        opaque gfid[20];
        unsigned int namelen;
        string     name<>;
        gfx_dict xdata; /* Extra data */
}  ;


 struct gfx_fgetxattr_req  {
        opaque gfid[20];
        quad_t  fd;
        unsigned int namelen;
        string     name<>;
        gfx_dict xdata; /* Extra data */
}  ;

 struct gfx_removexattr_req {
        opaque gfid[20];
        string     name<>;
        gfx_dict xdata; /* Extra data */
}  ;

 struct gfx_fremovexattr_req {
        opaque gfid[20];
        quad_t  fd;
        string     name<>;
        gfx_dict xdata; /* Extra data */
}  ;


 struct gfx_opendir_req {
        opaque gfid[20];
        gfx_dict xdata; /* Extra data */
}  ;
 struct gfx_opendir_rsp {
        int    op_ret;
        int    op_errno;
        gfx_dict xdata; /* Extra data */
        quad_t fd;
}  ;


 struct gfx_fsyncdir_req {
        opaque gfid[20];
        quad_t  fd;
        int  data;
        gfx_dict xdata; /* Extra data */
}  ;

 struct   gfx_readdir_req  {
        opaque gfid[20];
        quad_t  fd;
        u_quad_t offset;
        unsigned int size;
        gfx_dict xdata; /* Extra data */
};

 struct gfx_readdirp_req {
        opaque gfid[20];
        quad_t  fd;
        u_quad_t offset;
        unsigned int size;
        gfx_dict xdata;
}  ;


struct gfx_access_req  {
        opaque gfid[20];
        unsigned int mask;
        gfx_dict xdata; /* Extra data */
} ;


struct gfx_create_req {
        opaque  pargfid[20];
        unsigned int flags;
        unsigned int mode;
        unsigned int umask;
        string     bname<>;
        gfx_dict xdata; /* Extra data */
}  ;
struct  gfx_create_rsp {
        int    op_ret;
        int    op_errno;
        gfx_dict xdata; /* Extra data */
        gfx_iattx stat;
        u_quad_t       fd;
        gfx_iattx preparent;
        gfx_iattx postparent;
} ;

struct   gfx_ftruncate_req  {
        opaque gfid[20];
        quad_t  fd;
        u_quad_t offset;
        gfx_dict xdata; /* Extra data */
} ;


struct gfx_fstat_req {
        opaque gfid[20];
        quad_t  fd;
        gfx_dict xdata; /* Extra data */
}  ;


struct gfx_entrylk_req {
        opaque gfid[20];
        unsigned int  cmd;
        unsigned int  type;
        u_quad_t  namelen;
        string      name<>;
        string      volume<>;
        gfx_dict xdata; /* Extra data */
};

struct gfx_fentrylk_req {
        opaque gfid[20];
        quad_t   fd;
        unsigned int  cmd;
        unsigned int  type;
        u_quad_t  namelen;
        string      name<>;
        string      volume<>;
        gfx_dict xdata; /* Extra data */
};

 struct gfx_setattr_req {
        opaque gfid[20];
        gfx_iattx stbuf;
        int        valid;
        gfx_dict xdata; /* Extra data */
}  ;

 struct gfx_fallocate_req {
        opaque          gfid[20];
        quad_t          fd;
        unsigned int    flags;
        u_quad_t        offset;
        u_quad_t        size;
        gfx_dict xdata; /* Extra data */
}  ;

struct gfx_discard_req {
        opaque          gfid[20];
        quad_t          fd;
        u_quad_t        offset;
        u_quad_t        size;
        gfx_dict xdata; /* Extra data */
}  ;

struct gfx_zerofill_req {
        opaque          gfid[20];
        quad_t           fd;
        u_quad_t  offset;
        u_quad_t  size;
        gfx_dict xdata;
}  ;

struct gfx_rchecksum_rsp {
        int    op_ret;
        int    op_errno;
        gfx_dict xdata; /* Extra data */
        unsigned int weak_checksum;
        opaque   strong_checksum<>;
}  ;


struct gfx_ipc_req {
        int     op;
        gfx_dict xdata;
};


struct gfx_seek_req {
        opaque    gfid[20];
        quad_t    fd;
        u_quad_t  offset;
        int       what;
        gfx_dict xdata;
};

struct gfx_seek_rsp {
        int       op_ret;
        int       op_errno;
        gfx_dict xdata;
        u_quad_t  offset;
};


 struct gfx_setvolume_req {
        gfx_dict dict;
}  ;
 struct  gfx_setvolume_rsp {
        int    op_ret;
        int    op_errno;
        gfx_dict dict;
} ;


 struct gfx_getspec_req {
        unsigned int flags;
        string     key<>;
        gfx_dict xdata; /* Extra data */
}  ;
 struct  gfx_getspec_rsp {
        int    op_ret;
        int    op_errno;
        string spec<>;
        gfx_dict xdata; /* Extra data */
} ;


 struct gfx_notify_req {
        unsigned int  flags;
        string buf<>;
        gfx_dict xdata; /* Extra data */
}  ;
 struct gfx_notify_rsp {
        int    op_ret;
        int    op_errno;
        unsigned int  flags;
        string buf<>;
        gfx_dict xdata; /* Extra data */
}  ;

struct gfx_releasedir_req {
        opaque gfid[20];
        quad_t  fd;
        gfx_dict xdata; /* Extra data */
}  ;

struct gfx_release_req {
        opaque gfid[20];
        quad_t  fd;
        gfx_dict xdata; /* Extra data */
}  ;

struct gfx_dirlist {
       u_quad_t d_ino;
       u_quad_t d_off;
       unsigned int d_len;
       unsigned int d_type;
       string name<>;
       gfx_dirlist *nextentry;
};


struct gfx_readdir_rsp {
       int op_ret;
       int op_errno;
       gfx_dirlist *reply;
        gfx_dict xdata; /* Extra data */
};

struct gfx_dirplist {
       u_quad_t d_ino;
       u_quad_t d_off;
       unsigned int d_len;
       unsigned int d_type;
       string name<>;
       gfx_iattx stat;
       gfx_dict dict;
       gfx_dirplist *nextentry;
};

struct gfx_readdirp_rsp {
       int op_ret;
       int op_errno;
       gfx_dirplist *reply;
       gfx_dict xdata; /* Extra data */
};

struct gfx_set_lk_ver_rsp {
       int op_ret;
       int op_errno;
       gfx_dict xdata;
       int lk_ver;
};

struct gfx_set_lk_ver_req {
       string uid<>;
       int lk_ver;
};

struct gfx_event_notify_req {
        int op;
        gfx_dict dict;
};


struct gfx_getsnap_name_uuid_req {
        gfx_dict dict;
};

struct gfx_getsnap_name_uuid_rsp {
        int op_ret;
        int op_errno;
        gfx_dict dict;
        string op_errstr<>;
};

struct gfx_getactivelk_rsp {
        int op_ret;
        int op_errno;
        gfx_dict xdata;
        gfs3_locklist *reply;
};

struct gfx_getactivelk_req {
        opaque gfid[20];
        gfx_dict xdata;
};

struct gfx_setactivelk_req {
        opaque gfid[20];
        gfs3_locklist *request;
        gfx_dict xdata;
};
