**Project Summary**

Colleagues may grant redeemable points to other colleagues that can be used to exchange for prizes. The Project will keep track of colleagues and their total points earned and points to give. The Project will also keep a catalogue of prizes. There will be a single admin user that can add/remove/edit "participant" users.

**Possible Features**
- Import participants from CSV or XLS
- Create prizes with images and descriptions, and images can be uploaded to aws for storage
- Admin user can create participants with :username :points and set default point allotment
- Increment or decrement points for participants by a specified amount
- Enable participants to look up their earned/avilable points
- Participants can look up prizes
- 
**Possible Gems/Libraries**
- bcrypt unless using Devise
- aws
- jQuery
- SASS
- 
**Current Features**
- Single user Authentication using bcrypt and has_secure_password
- Styled flash messages with jQuery and toastr_rails