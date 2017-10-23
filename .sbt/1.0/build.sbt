import de.heikoseeberger.sbtfresh.FreshPlugin.autoImport._
import de.heikoseeberger.sbtfresh.license.License // Only needed for `freshLicense` setting

freshAuthor       := "Hywel Andrews"   // Author – value of "user.name" sys prop or "default" by default
freshOrganization := "com.owlandrews" // Build organization – "default" by default
freshSetUpGit     := false                // Initialize a Git repo and create an initial commit – true by default
freshSetUpTravis      := false              // Configure Travis for Continuous Integration - `true` by default
freshSetUpWartremover := false              // Include the sbt wartremover (http://www.wartremover.org) plugin - `false` by default
freshLicense          := Some(License.mit) 