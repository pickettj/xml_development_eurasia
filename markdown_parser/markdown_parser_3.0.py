#!/usr/bin/env python
# coding: utf-8

# # Custom Markdown Parser
#
# Inputs markdown, outputs XML based on a custom schema using regex.

# Next steps:
# - Code batch processing (i.e. open all files in one directory, output to another).
# - Automate transfer of process files to new directory to simplify workflow.

# In[2]:


# Notes on Version 2 (From General Hanley):

# Advocates transcending the "line-by-line approach":
# If you give re.sub the flags=re.MULTILINE option, then ^ and $ will match the
# beginning and end of lines, rather than the whole string. That way you
# can do it for the whole file at once. This should in principle be faster too.


# In[1]:


import re, os, os.path, shutil

# custom functions:
import parser_functions as pf


# ### File Paths

# Nice [[explanation of using the os library]](https://automatetheboringstuff.com/chapter8/).

# In[13]:


# Input Folder
hdir = os.path.expanduser('~')
md_rel_path = "/Dropbox/Active_Directories/Notes/Primary_Sources/transcription_markdown_drafting_stage1"
md_path = hdir + md_rel_path

# Destination Folder
xml_rel_path = r"/Dropbox/Active_Directories/Notes/Primary_Sources/xml_notes_stage2/parser_depository"
xml_path = hdir + xml_rel_path

# Folder to archive old Markdown files
archive_rel_path = "/Dropbox/Active_Directories/Notes/Primary_Sources/transcription_markdown_drafting_stage1/archive_docs_now_at_xml_stage_do_not_use"
archive_path = hdir + archive_rel_path

print ("Files currently in input folder ", os.path.dirname(md_path), ":\n")
print(os.listdir(md_path))


# In[11]:


# Minor: note that os.path.dirname lists the name of the parent folder, not the targeted one
print ("Files currently in destination folder ", os.path.dirname(xml_path), ":\n")

print(os.listdir(xml_path))


# ## The Parser

# In[4]:


# Making sure in correct directory:
os.chdir(md_path)


# ### Run parser on every file in the input directory, copy to output directory

# In[5]:


for filename in os.listdir(md_path):
    if filename.endswith(".txt") or filename.endswith(".md"):
        # Make sure in input directory
        os.chdir(md_path)

        # Export filename
        output_file = "ser" + pf.serial_no(filename) + ".xml"

        # MD parsed into XML text for output
        output_text = pf.parse_md(filename)

        # Send file
        with open(xml_path + "/" + output_file, 'w+') as fout:
            fout.write(output_text)

        # Archived filename
        archive_file = "archived_no" + pf.serial_no(filename) + ".txt"

        # Move active file to the archive folder
        shutil.move(md_path + "/" + filename, archive_path + "/" + archive_file)



# In[ ]:





# In[ ]:
