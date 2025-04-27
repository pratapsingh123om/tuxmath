/* Convenience header for conditional use of GNU <libintl.h>.
   Copyright (C) 1995-1998, 2000-2002, 2004-2006 Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify it
   under the terms of the GNU Library General Public License as published
   by the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Library General Public License for more details.

   You should have received a copy of the GNU Library General Public
   License along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301,
   USA.  */

#ifndef GETTEXT_H
#define GETTEXT_H

#include <string.h>
#include <stdlib.h>

#ifdef ENABLE_NLS
  #include <libintl.h>
  #include <locale.h>
  #define gettext_noop(String) String
  #define _(String) gettext(String)
  #define N_(String) gettext_noop(String)
  #define D_(String) dgettext(PACKAGE, String)
#else
  #define _(String) (String)
  #define N_(String) String
  #define D_(String) String
  #define textdomain(Domain)
  #define bindtextdomain(Package, Directory)
  #define dcgettext(Domain, String, Category) (String)
#endif

static inline const char *
dcgettext_expr(const char *domain,
               const char *msgid,
               const char *msgctxt,
               int category)
{
    const char *translation;
    size_t msgctxt_len = strlen(msgctxt) + 1;
    size_t msgid_len = strlen(msgid) + 1;
    char *msg_ctxt_id = (char*)malloc(msgctxt_len + msgid_len);
    
    if (msg_ctxt_id != NULL) {
        memcpy(msg_ctxt_id, msgctxt, msgctxt_len - 1);
        msg_ctxt_id[msgctxt_len - 1] = '\004';
        memcpy(msg_ctxt_id + msgctxt_len, msgid, msgid_len);
        translation = dcgettext(domain, msg_ctxt_id, category);
        free(msg_ctxt_id);
        
        if (translation == msg_ctxt_id)
            return msgid;
        else
            return translation;
    }
    return msgid;
}

#endif /* GETTEXT_H */
