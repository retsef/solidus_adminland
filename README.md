![desktop](https://imgur.com/HtCxrsM)

# Solidus Adminland

### This is a pre-alfa stage and can be changed in the future. 
---

This starts as a fun project to make a more reliable version of [solidus_admin](https://github.com/solidus/solidus) admin panel.
Solidus has a great core component and a battery included admin interface, but, in my opinion and due to my customizations, the admin gen lacks of design for beeing a real side infrastructure for comunicating with solidus_core structure.

## Why rewrite the wheel?

As said, in my opinion, solidus_admin relay on so many caveout of beeing stuck to the library chosed back then and this make it opinionable for different reason:
- So many of the filters on index are made with ransack: It's ok but there are soo many customization for custom params digest and this cause non consitency between controllers
- Relay too much on cancan: this choice is not bad but it relay its usage with 'macros' (:manage, :admin) and not with real CRUD routes and not stick on conventions of MVC pattern.
- The assets for javascript files and stylesheet are difficult to synergize with the hosting rails app and relies on opinionable implementation such as Backbone inerithed from Spree 2.4 fork.
- Rely on solidus_api for ajax interactions with certain sections such as Orders and this approches are essentially DOM maninpulation and for coexcion of responsability those bonds are too strict in this era.
- Not "really" turbo compatible: Turbolinks is evolved in hotwire and the current usage are only a snippet for javascript correct script execution.
- usage of rails-ujs and 'remote: true' approach are opinionable, mostly for 'remote' usage. I think that remote is not a good approach because it injects javascript code in the browser console in hoping to be executed and is, for me, as cross scripting potential security threat.

As you see, the solidus_admin is pretty old and as for the [solidus_frontend](https://github.com/solidus/solidus) revamp with solidus_starter_frontend it's time for a renewal!

## Are you tryng to create a new solidus_admin gem?

Sort of but No. I'm starting this as an alternative because it's an alpha project and it's objective it's to offer, along a battery included backend with low couppling with rails framework, but also a pretty structured Adminland framework for extendability and UI customizzation without headdacle.

## Ok, so what is your choice? Are also yours opinionable?

I think we could think for the adminland code structure to repect this fundamentals:
- Be easy to override and extends with less overrides/monkey-patch approach. We are humans not monkey!
- Prior ban for Deface. I never liked the deface approach and i think is better to think the UI as modular from the beginning, in alternative overriding views by copy but not by patch and inject
- Strict to CRUD routes. Everithing must rely on CRUDs routes as strict as possible, as also for nested routes approach, in favor of convention over configuration approach
- Add external resources from hosting rails app should with a generator scaffold template

With this in mind i have begin to put some choices for the 'new' solidus_adminland project such as:
- hotwire by default. If i need to update interface i prefer to replace/update html pages with html reponses
- stimulus for simple and reliable additions such as pickers, input mask and form validations
- usage of view_component gem for incapsulate helper methods with HTML reasult (such as link_to o more complex ones). Is easier also for override purpose, in alternative to partials for reliability and PORO class for UI logic
- Every import of assets is made with rails-importmap for 'no javascript centric app approach'
- Usage of administrate gem for division of concern between represantation (with *Dashboard class) and CRUD routes for data to show or submit
- Every forms are styled by FormBuilder where every field is rendered with separated Component class. If in feature we or someone want to put some strange field such as Dropdown JS ones it can be made with new Admininstrate::Field, FormBuilder::Component and stimulus for js sparkle 🪄
- for policy manner i think that we must rely on standard checks like 'allowed_to? :edit, resource' or 'allowed_to? :index, resource' and for this approach i choose [action_policy](https://github.com/palkan/action_policy) gem. Its rely on a PORO object where we could define for each action what are the rule for going throught. It is a real middle piece for controllers for control policy over 'record scope', 'record permitted params' and 'record accessible routes'.

As you can see, for every resource there is:
- a Controller with the same name for standard CRUD operations
- a Dashboard with same name for index, new_form, edit_form and show params to display
- a Policy for wich scope with current user i can access, wich params i can submit and wich route i'm allowed for that resource.

... and as a 'conventional' approach you could just create your own (or extend 😉) of those three and put you business logic as you like (or your app demands)!

The initial design is made with bootstrap 5 but you can easly override the standard views from admin/application for CRUD. The number of views will remain strict to low as possible

## Roadmap

- [ ] Products CRUD
  - [ ] Variants CRUD
  - [ ] Prices CRUD
  - [ ] Images

- [ ] Orders CRUD
  - [ ] Line Items CRUD
  - [ ] Customer info CRUD
  - [ ] Payments CRUD

- [ ] Promotions CRUD
  - [ ] Promotion Codes CRUD
  - [ ] Promotion Rules CRUD
  - [ ] Promotion Actions CRUD
- [x] Promotion Category CRUD

- [x] Stores CRUD
- [x] Option Type CRUD
- [x] Option Value CRUD
- [x] Property CRUD
- [x] Shipping Category CRUD
- [x] Shipoing Method CRUD
- [x] Stock Locations CRUD
- [x] Tax Category CRUD
- [x] Tax Rate CRUD
- [x] Taxonomy CRUD
- [x] Taxon CRUD
- [x] Payment Method CRUD

All the rights of logos and colors are get from solidus presskit
The Admin theme is inspired from solidus website mockups and based on [Bootstrap 5](https://getbootstrap.com) version of [Tabler](https://github.com/tabler/tabler)
