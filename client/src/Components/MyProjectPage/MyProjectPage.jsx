import { useEffect, useMemo, useState } from "react"
import { AlertTriangle, Users, FileText, ShieldCheck } from "lucide-react"
import { axiosInstance } from "../../utils/authService"
import toast from "react-hot-toast"
import "./MyProjectPage.css"

const MyProjectPage = ({ user }) => {
  const [loading, setLoading] = useState(true)
  const [isLeader, setIsLeader] = useState(false)
  const [team, setTeam] = useState(null)
  const [members, setMembers] = useState([])
  const [engineers, setEngineers] = useState([])
  const [supervisors, setSupervisors] = useState([])
  const [form, setForm] = useState({
    nameEn: "",
    nameAr: "",
    description: "",
    additionalInformation: "",
  })
  const [isSaving, setIsSaving] = useState(false)
  const [lastSavedAt, setLastSavedAt] = useState(null)

  const currentUserId = useMemo(() => user?.id ?? null, [user])

  const fetchProjectFromServer = async () => {
    try {
      const res = await axiosInstance.get(`/Project/My`)
      const data = res?.data || null
      if (data) {
        setForm({
          nameEn: data.nameEn || "",
          nameAr: data.nameAr || "",
          description: data.projectDescription || "",
          additionalInformation: data.additionalInformation || "",
        })
      }
    } catch {
      // No project yet on server — keep empty form
    }
  }

  const fetchTeamMembersAndStaff = async (normalizedTeam) => {
    if (!normalizedTeam?.id) return
    try {
      // 1. Members
      const tmRes = await axiosInstance.get(`/TeamMembers`)
      const tmList = tmRes.data?.$values || tmRes.data || []
      const filteredMembers = (Array.isArray(tmList) ? tmList : [])
        .filter((m) => (m.teamId ?? m.TeamId) === normalizedTeam.id)
        .map((m) => ({
          id: m.teamMemberAccountId ?? m.TeamMemberAccountId,
          fullName: m.memberName ?? m.MemberName ?? "Member",
          email: m.memberEmail ?? m.MemberEmail ?? "",
          role: m.teamMemberDescription ?? m.TeamMemberDescription ?? "Team Member",
        }))
      setMembers(filteredMembers)

      // 2. Engineers (by class)
      if (normalizedTeam.classId) {
        try {
          const revRes = await axiosInstance.get(`/Account/Reviewers/ByClass/${normalizedTeam.classId}`)
          const rData = revRes.data
          const rList = Array.isArray(rData) ? rData : rData?.$values || []
          const mappedEngs = rList.map((r) => ({
            id: r.accountId || r.AccountId,
            fullName: r.fullNameEn || r.fullNameAr || "Engineer",
            email: r.email || r.Email || "",
            role: "Engineer",
          }))
          setEngineers(mappedEngs)
        } catch {
          setEngineers([])
        }
      }

      // 3. Capstone supervisors
      try {
        const csRes = await axiosInstance.get(`/Account/CapstoneSupervisors`)
        const csData = csRes.data
        const csList = Array.isArray(csData) ? csData : csData?.$values || []
        const mappedSupervisors = csList.map((s) => ({
          id: s.accountId || s.AccountId,
          fullName: s.fullNameEn || s.fullNameAr || "Supervisor",
          email: s.email || s.Email || "",
          role: "Capstone Supervisor",
        }))
        setSupervisors(mappedSupervisors)
      } catch {
        setSupervisors([])
      }
    } catch (err) {
      console.error("MyProjectPage - Error fetching team members and staff:", err)
    }
  }

  const fetchData = async () => {
    try {
      setLoading(true)
      if (!currentUserId) {
        toast.error("User not found")
        setLoading(false)
        return
      }

      let teamRes = null
      try {
        const res = await axiosInstance.get(`/Teams/ByLeader/${currentUserId}`)
        teamRes = res?.data || null
      } catch {
        teamRes = null
      }

      let teamObj = null
      if (teamRes && teamRes.id) {
        setIsLeader(true)
        teamObj = {
          id: teamRes.id || teamRes.Id,
          teamName: teamRes.teamName || teamRes.TeamName || "My Team",
          classId: teamRes.classId || teamRes.ClassId || null,
          teamLeaderAccountId: teamRes.teamLeaderAccountId || teamRes.TeamLeaderAccountId || currentUserId,
        }
      } else {
        const membersResp = await axiosInstance.get(`/TeamMembers`)
        const membersList = membersResp.data?.$values || membersResp.data || []
        const myMembership = membersList.find((m) => m.teamMemberAccountId === currentUserId)
        if (myMembership && myMembership.teamId) {
          try {
            const t = await axiosInstance.get(`/Teams/${myMembership.teamId}`)
            const tData = t.data || {}
            teamObj = {
              id: tData.Id || tData.id || myMembership.teamId,
              teamName: tData.TeamName || tData.teamName || myMembership.TeamName || "My Team",
              classId: tData.ClassId || tData.classId || null,
              teamLeaderAccountId: tData.TeamLeaderAccountId || tData.teamLeaderAccountId || null,
            }
          } catch {
            teamObj = { id: myMembership.teamId, teamName: myMembership.TeamName || "My Team" }
          }
        }
        setIsLeader(false)
      }

      setTeam(teamObj)

      if (teamObj && teamObj.id) {
        await fetchProjectFromServer()
        await fetchTeamMembersAndStaff(teamObj)
      }

      setLoading(false)
    } catch (err) {
      console.error("MyProjectPage fetch error:", err)
      toast.error("Failed to load project info")
      setLoading(false)
    }
  }

  useEffect(() => {
    fetchData()
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [currentUserId])

  const handleChange = (field, value) => {
    setForm((prev) => ({ ...prev, [field]: value }))
  }

  const handleSave = async () => {
    if (!team?.id) {
      toast.error("No team assigned")
      return
    }
    try {
      setIsSaving(true)
      setLastSavedAt(new Date())
      toast.loading("Saving to server...", { id: "save-project" })
      try {
        await axiosInstance.post(`/Project/My`, {
          nameEn: form.nameEn,
          nameAr: form.nameAr,
          additionalInformation: form.additionalInformation,
          projectDescription: form.description,
          statusId: 1
        })
        toast.success("Project saved", { id: "save-project" })
        if (form.nameEn) {
          setTeam((prev) => (prev ? { ...prev, teamName: form.nameEn } : prev))
        }
      } catch (err) {
        if (err?.response?.status === 403) {
          toast.error("Not allowed to save (leader or admin only)", { id: "save-project" })
        } else if (err?.response?.status === 429) {
          toast.error("Too many requests. Please wait", { id: "save-project" })
        } else {
          toast.error("Server error while saving", { id: "save-project" })
        }
      }
      setIsSaving(false)
    } catch (e) {
      setIsSaving(false)
      toast.error("Failed to save locally")
    }
  }

  if (loading) {
    return (
      <div className="my-project-page">
        <div className="loading-container">
          <div className="loading-spinner"></div>
          <div className="loading-text">
            <div className="loading-title">Loading Project Data</div>
            <div className="loading-subtitle">Please wait while we fetch your project information...</div>
          </div>
        </div>
      </div>
    )
  }

  if (!team) {
    return (
      <div className="my-project-page">
        <div className="no-team-message">
          <AlertTriangle size={48} style={{ color: '#f59e0b', marginBottom: '16px' }} />
          <h3 style={{ color: '#dc2626', marginBottom: '8px' }}>No Team Assigned</h3>
          <p style={{ color: '#6b7280', marginBottom: '12px' }}>
            You are not currently assigned to any team.
          </p>
          <p style={{ color: '#9ca3af', fontSize: '14px' }}>
            Please contact your instructor or administrator to be assigned to a team.
          </p>
        </div>
      </div>
    )
  }

  return (
    <div className="my-project-page">
      <div className="hero" style={{ animation: 'fadeInDown 0.3s ease-out' }}>
        <div className="hero-content">
          <div className="hero-top">
            <h1 className="title">My Project</h1>
            <span className={`role-badge ${isLeader ? 'leader' : 'member'}`}>{isLeader ? 'Team Leader' : 'Team Member'}</span>
          </div>
          {team && <p className="subtitle">Team: {team.teamName || "My Team"}</p>}
          <p className="note">You can edit your team's project details and save changes directly to the database.</p>
        </div>
      </div>

      <div className="meta-bar">
        {!!lastSavedAt && (
          <div className="last-saved">Last saved {lastSavedAt.toLocaleTimeString()}</div>
        )}
      </div>

      <div className="myproject-grid" style={{ animation: 'fadeIn 0.4s ease-out 0.1s both' }}>
        <div className="card form-card">
          <div className="section-header">
            <h3>Project Identity</h3>
            <p>Provide a clear, bilingual name and your company affiliation.</p>
          </div>
          <div className="form-group">
            <label>Project Name (EN)</label>
            <input
              type="text"
              className="input"
              value={form.nameEn}
              onChange={(e) => handleChange("nameEn", e.target.value)}
              placeholder="e.g., Smart Energy Monitoring System"
              maxLength={120}
            />
            <div className="help-row">
              <span className="help-text">Up to 120 characters</span>
              <span className="counter">{(form.nameEn || "").length}/120</span>
            </div>
          </div>

          <div className="form-group">
            <label>Project Name (AR)</label>
            <input
              type="text"
              className="input"
              value={form.nameAr}
              onChange={(e) => handleChange("nameAr", e.target.value)}
              placeholder="مثال: نظام مراقبة الطاقة الذكي"
              maxLength={120}
            />
            <div className="help-row">
              <span className="help-text">حتى ١٢٠ حرفًا</span>
              <span className="counter">{(form.nameAr || "").length}/120</span>
            </div>
          </div>

          <div className="section-header">
            <h3>Details</h3>
            <p>Summarize the scope, objectives, and technologies.</p>
          </div>
          <div className="form-group">
            <label>Project Description</label>
            <textarea
              className="textarea"
              rows={8}
              value={form.description}
              onChange={(e) => handleChange("description", e.target.value)}
              placeholder="Describe the project scope, objectives, and technologies used"
              maxLength={1200}
            />
            <div className="help-row">
              <span className="help-text">Aim for clarity and impact</span>
              <span className="counter">{(form.description || "").length}/1200</span>
            </div>
          </div>

          <div className="form-group">
            <label>Additional Information</label>
            <textarea
              className="textarea"
              rows={4}
              value={form.additionalInformation}
              onChange={(e) => handleChange("additionalInformation", e.target.value)}
              placeholder="Any extra notes or links"
              maxLength={800}
            />
            <div className="help-row">
              <span className="help-text">Links, references, constraints, etc.</span>
              <span className="counter">{(form.additionalInformation || "").length}/800</span>
            </div>
          </div>

          <div className="actions">
            <button className="save-btn" onClick={handleSave} disabled={isSaving}>
              {isSaving ? 'Saving...' : 'Save'}
            </button>
          </div>
        </div>

        <div className="right-column">
          {/* Members Card */}
          <div className="card">
            <h3 className="section-title"><Users size={18} /> Members</h3>
            <div className="list">
              {members.length === 0 ? (
                <div className="empty">No members found</div>
              ) : (
                members.map((m) => (
                  <div key={m.id} className="list-item">
                    <div className="avatar">{(m.fullName || "M").charAt(0)}</div>
                    <div className="item-info">
                      <div className="name-row">
                        <span className="name">{m.fullName}</span>
                        {m.id === team?.teamLeaderAccountId && <span className="badge">Leader</span>}
                      </div>
                      <span className="secondary">{m.role || "Team Member"}</span>
                      {m.email && <span className="tertiary">{m.email}</span>}
                    </div>
                  </div>
                ))
              )}
            </div>
          </div>

          {/* Engineers Card */}
          <div className="card">
            <h3 className="section-title"><FileText size={18} /> Engineers</h3>
            <div className="list">
              {engineers.length === 0 ? (
                <div className="empty">No engineers assigned</div>
              ) : (
                engineers.map((r) => (
                  <div key={r.id} className="list-item small">
                    <div className="avatar small">{(r.fullName || "E").charAt(0)}</div>
                    <div className="item-info">
                      <span className="name">{r.fullName}</span>
                      <span className="secondary">{r.role}</span>
                      {r.email && <span className="tertiary">{r.email}</span>}
                    </div>
                  </div>
                ))
              )}
            </div>
          </div>

          {/* Supervisors Card */}
          {supervisors.length > 0 && (
            <div className="card">
              <h3 className="section-title"><ShieldCheck size={18} /> Supervisors</h3>
              <div className="list">
                {supervisors.map((s) => (
                  <div key={s.id} className="list-item small">
                    <div className="avatar small">{(s.fullName || "S").charAt(0)}</div>
                    <div className="item-info">
                      <span className="name">{s.fullName}</span>
                      <span className="secondary">{s.role}</span>
                      {s.email && <span className="tertiary">{s.email}</span>}
                    </div>
                  </div>
                ))}
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  )
}

export default MyProjectPage
