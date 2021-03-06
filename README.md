<p float="left">
  <img src="https://i.imgur.com/RlbtXTH.png" width="100%" />
  <img src="https://i.imgur.com/Z8zW8lC.png" width="49.5%" />
  <img src="https://i.imgur.com/Xe1lRjZ.png" width="49.5%" />
</p>

# Solidus Adminland

### This is a pre-alfa stage and can be changed in the future. 
---

This starts as a fun project for internal purpose to make a more reliable version of [solidus_backend](https://github.com/solidusio/solidus/tree/master/backend) admin panel.
Solidus has a great core component and a battery included admin interface but, in our opinion and due to our customizations, the admin gem lacks of design stucture for being a real side infrastructure for comunicating with solidus_core structure.

## Features
- Beatiful and easy to use (UX matters)
- Hotwire Turbo powered ⚡️
- Stimulus with importmaps for small sparkles ✨
- Filtering made easy with Ransack
- Batch operations like destroy

## Why rewrite the wheel?

As said, in our opinion, solidus_backend relay on so many caveout of being stuck to libraries chosed back to the spree fork (Deface im looking at you!) and this stucure is too strict to those choices:
- So many of the filters with ransack are being messy with custom params digest
- Cancan usage with 'macros' (:manage, :admin) and not with real CRUD routes and not stick on conventions of MVC pattern.
- Product, order and promotion edit rely on ajax with backbone and not on a more conventional CRUD behaviour.
- Not "really" turbo compatible: Turbolinks is evolved in hotwire and the current usage are only a snippet for javascript correct script execution.
- Heavy use of javascript remote execution of rails-ujs and 'remote: true' instead of a more clean and predictable html response with turbo. I think that remote is not a good approach because it injects javascript code in the browser console in hoping to be executed and is, for me, as cross scripting potential security threat.

As you see, the solidus_admin is pretty old and as for the [solidus_frontend](https://github.com/solidusio/solidus/tree/master/frontend) revamp with [solidus_starter_frontend](https://github.com/solidusio/solidus_starter_frontend) it's time for a heavy experiment and renewal!

## Are you tryng to create a new solidus_backend gem?

Sort of but **No**. I'm starting this as an alternative project first of all because it's an alpha project and it's objective it's to offer, along a battery included backend with low couppling with rails framework, but also a pretty structured Adminland framework for extendability and UI customizzation without headdacle.
I want to be make it more rely on the library choised from the owner of the host project, as an easy integration without bee too strict.

## Ok, so what is your choice? Are also yours opinionable?

I think we could think for the adminland code structure to repect this fundamentals:
- Be easy to override and extends with less overrides/monkey-patch approach. We are humans not monkey!
- Prior ban for Deface. I never liked the deface approach and i think is better to think the UI as modular from the beginning, in alternative overriding views by copy but not by patch and inject. For the extedability of another sidecar tool (all the solidus extensions with admin sections), i prefer to make a more clear and exposed point-of-prepend.
- Strict to CRUD routes. Everithing must rely on CRUDs routes as strict as possible, as also for nested routes approach, in favor of convention over configuration approach.
- Add external resources from hosting rails app should with a generator scaffold template.

With this in mind i have begin to put some choices for the 'new' solidus_adminland project such as:
- hotwire by default and encourage to more than a js DOM manipulation approach.
- stimulus for simple and reliable additions such as pickers, input mask and form validations
- usage of view_component gem for incapsulate helper methods with HTML reasult (such as link_to o more complex ones). Is easier also for override purpose, in alternative to partials for reliability and PORO class for UI logic
- Every import of assets is made with rails-importmap for 'no javascript centric app approach'
- Usage of administrate gem for division of concern between represantation (with *Dashboard class) and CRUD routes for data to show or submit
- Every forms are styled by FormBuilder where every field is rendered with separated Component class. If in feature we or someone want to put some strange field such as Dropdown JS ones it can be made with new Admininstrate::Field, FormBuilder::Component and stimulus for js sparkle 🪄
- For policy manner i think that we could make an hybrid approach to be compatible with cancan but with a more easy pudit approach. In our case we use [action_policy](https://github.com/palkan/action_policy) gem. Its rely on a PORO object where we could define for each action what are the rule for going throught. It is a real middle piece for controllers for control policy over 'record scope', 'record permitted params' and 'record accessible routes'.

As you can see, for every resource there is:
- a Controller with the same name for standard CRUD operations
- a Dashboard with same name for index, new_form, edit_form and show params to display
- a Policy for wich scope with current user i can access, wich params i can submit and wich route i'm allowed for that resource.

... and as a 'conventional' approach you could just create your own (or extend 😉) of those three and put you business logic as you like (or your app demands)!

The initial design is made with bootstrap 5 with [Tabler](https://github.com/tabler/tabler) but you can easly override the standard views from admin/application for CRUD. The number of views will remain strict to low as possible

## Roadmap

- [x] Products CRUD
  - [x] Variants CRUD
  - [x] Prices CRUD
  - [x] Images CRUD
  - [x] Stocks CRUD

- [x] Variants CRUD
  - [x] Prices CRUD
  - [x] Images CRUD
  - [x] Stocks CRUD

- [x] Orders CRUD
  - [x] Line Items CRUD
  - [x] Customer info CRUD
  - [x] Payments CRUD
  - [x] Shipments CRUD
  - [x] Adjustments CRUD
  - [-] Refunds CRUD
  - [ ] RMA CRUD

- [x] Promotions CRUD
  - [x] Promotion Codes CRUD
  - [-] Promotion Rules CRUD
  - [-] Promotion Actions CRUD
- [x] Promotion Category CRUD

- [x] Stores CRUD
- [x] Option Type CRUD
- [x] Option Value CRUD
- [x] Property CRUD
- [x] Shipping Category CRUD
- [-] Shipping Method CRUD
- [x] Stock Locations CRUD
- [x] Tax Category CRUD
- [x] Tax Rate CRUD
- [x] Taxonomy CRUD
- [x] Taxon CRUD
- [x] Payment Method CRUD

All the rights of logos and colors are get from solidus presskit
The Admin theme is inspired from solidus website mockups and based on [Bootstrap 5](https://getbootstrap.com) version of [Tabler](https://github.com/tabler/tabler)
