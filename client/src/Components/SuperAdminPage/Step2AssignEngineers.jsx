import React, { useState, useEffect, useMemo } from 'react';
import {
  DndContext,
  DragOverlay,
  PointerSensor,
  MouseSensor,
  TouchSensor,
  useSensor,
  useSensors,
  useDraggable,
  useDroppable
} from '@dnd-kit/core';
import { CSS } from '@dnd-kit/utilities';
import {
  Users,
  Search,
  X,
  Plus,
  Trash2,
  AlertCircle,
  CheckCircle,
  RefreshCw,
  Sparkles,
  UserPlus
} from 'lucide-react';
import { isEngineer, isBoard } from '../../utils/roleUtils';
import { showSuccess, showError, showWarning } from '../../utils/toast';
import ConfirmationDialog from '../ConfirmationDialog/ConfirmationDialog';
import { axiosInstance } from '../../utils/authService';
import './StepPages.css';

/* ── EngineerChip — Draggable engineer item ───────────────── */
function EngineerChip({ engineer, inCard, assignedTo, onRemove, overlay, sourceId }) {
  const { attributes, listeners, setNodeRef, transform, isDragging } = useDraggable({
    id: sourceId ?? `engineer-${engineer.id}`,
    data: { engineer },
    disabled: overlay,
  });
  const style = transform ? { transform: CSS.Translate.toString(transform) } : undefined;

  const engName = engineer?.fullNameEn || engineer?.fullNameAr || engineer?.name || 'Engineer';

  if (overlay) {
    return (
      <div className="inline-flex items-center gap-2 px-3.5 py-2 rounded-lg bg-red-600 text-white text-xs font-bold shadow-xl cursor-grabbing pointer-events-none z-50">
        <Users size={13} />
        <span>{engName}</span>
      </div>
    );
  }

  return (
    <div
      ref={setNodeRef}
      style={style}
      {...listeners}
      {...attributes}
      className={`inline-flex items-center gap-2 px-3 py-1.5 rounded-lg text-xs font-semibold border select-none cursor-grab active:cursor-grabbing transition-all ${
        isDragging
          ? 'opacity-20 scale-90'
          : inCard
          ? 'bg-red-50 text-red-700 border-red-200 hover:bg-red-100'
          : assignedTo
          ? 'bg-amber-50 text-amber-800 border-amber-200'
          : 'bg-white text-slate-700 border-slate-200 hover:border-red-400 hover:bg-red-50/30'
      }`}
    >
      <Users size={12} className="opacity-60 text-slate-500" />
      <span className="text-slate-800 font-semibold">{engName}</span>
      {assignedTo && !inCard && (
        <span className="px-1.5 py-0.5 rounded text-[9px] font-bold bg-amber-100 text-amber-800">
          {assignedTo}
        </span>
      )}
      {inCard && onRemove && (
        <button
          onPointerDown={(e) => e.stopPropagation()}
          onClick={(e) => {
            e.stopPropagation();
            onRemove();
          }}
          className="w-4 h-4 flex items-center justify-center rounded hover:bg-red-200 text-red-600 cursor-pointer ml-1 transition-all"
          title="Unassign Engineer"
        >
          <X size={10} />
        </button>
      )}
    </div>
  );
}

/* ── ClassCard — Droppable target card ───────────────────── */
function ClassCard({ id, label, gradeName, engineers, onRemove }) {
  const { setNodeRef, isOver } = useDroppable({ id: `class-${id}` });

  return (
    <div
      ref={setNodeRef}
      className={`flex flex-col rounded-xl border min-h-[160px] transition-all overflow-hidden bg-white ${
        isOver
          ? 'border-red-500 shadow-xl ring-2 ring-red-500/20 scale-[1.02]'
          : 'border-slate-200 hover:border-slate-300 shadow-sm'
      }`}
    >
      <div
        className={`flex items-center justify-between px-4 py-3 border-b transition-all ${
          isOver
            ? 'bg-red-600 border-red-500 text-white'
            : 'bg-slate-50 border-slate-100 text-slate-800'
        }`}
      >
        <div className="flex items-center gap-2">
          <Users size={14} className={isOver ? 'text-red-100' : 'text-red-600'} />
          <div className="flex flex-col">
            <span className={`text-xs font-extrabold ${isOver ? 'text-white' : 'text-slate-800'}`}>
              {label}
            </span>
            {gradeName && (
              <span className={`text-[10px] ${isOver ? 'text-red-100' : 'text-slate-500'}`}>
                {gradeName}
              </span>
            )}
          </div>
        </div>
        <span
          className={`text-[10px] font-bold px-2 py-0.5 rounded-full ${
            isOver ? 'bg-white/20 text-white' : 'bg-slate-100 text-slate-700 border border-slate-200'
          }`}
        >
          {engineers.length} {engineers.length === 1 ? 'Engineer' : 'Engineers'}
        </span>
      </div>
      <div
        className={`flex-1 p-3 transition-all flex flex-col ${
          isOver ? 'bg-red-50/50' : 'bg-white'
        }`}
      >
        {engineers.length > 0 ? (
          <div className="flex flex-wrap gap-1.5">
            {engineers.map((eng) => (
              <EngineerChip
                key={eng.id}
                engineer={eng}
                inCard
                sourceId={`card-${id}-${eng.id}`}
                onRemove={() => onRemove(eng.id)}
              />
            ))}
          </div>
        ) : (
          <div
            className={`flex-1 flex flex-col items-center justify-center rounded-lg border border-dashed min-h-[90px] ${
              isOver ? 'border-red-400 bg-red-50/60' : 'border-slate-200 bg-slate-50/50'
            }`}
          >
            <span
              className={`text-[10px] font-semibold uppercase tracking-wide ${
                isOver ? 'text-red-600 font-bold' : 'text-slate-400'
              }`}
            >
              {isOver ? 'Drop to assign' : 'Drop engineers here'}
            </span>
          </div>
        )}
      </div>
    </div>
  );
}

/* ── Main Component ────────────────────────────────────────── */
const Step2AssignEngineers = ({ onNext, onPrev, currentStep, user }) => {
  // Check if user is Engineer - hide this page from engineers (allow Super Admin and Board)
  if (isEngineer(user) && !isBoard(user)) {
    return (
      <div className="step-page bg-white">
        <div className="step-header">
          <div className="step-title">
            <Users className="step-title-icon text-red-600" />
            <div>
              <h2 className="text-slate-800 font-bold">Access Denied</h2>
              <p className="text-slate-500">This page is only accessible to Super Administrators and Board members.</p>
            </div>
          </div>
        </div>
      </div>
    );
  }

  const [engineers, setEngineers] = useState([]);
  const [classes, setClasses] = useState([]);
  const [assignments, setAssignments] = useState([]);
  const [loading, setLoading] = useState(false);

  const [search, setSearch] = useState('');
  const [activeEngineer, setActiveEngineer] = useState(null);

  const [selectedEngineer, setSelectedEngineer] = useState('');
  const [selectedClass, setSelectedClass] = useState('');

  const [confirmationDialog, setConfirmationDialog] = useState({
    isOpen: false,
    title: '',
    message: '',
    onConfirm: null,
    type: 'warning'
  });

  const sensors = useSensors(
    useSensor(PointerSensor, { activationConstraint: { distance: 4 } }),
    useSensor(MouseSensor, { activationConstraint: { distance: 4 } }),
    useSensor(TouchSensor, { activationConstraint: { delay: 150, tolerance: 8 } })
  );

  useEffect(() => {
    fetchData();
  }, []);

  const fetchData = async () => {
    try {
      setLoading(true);
      const [engineersRes, classesRes, assignmentsRes] = await Promise.all([
        axiosInstance.get(`/Account/ByRoleName/Engineer`),
        axiosInstance.get(`/Class`),
        axiosInstance.get(`/Teams/Assignments`)
      ]);

      const engineersData = Array.isArray(engineersRes.data)
        ? engineersRes.data
        : engineersRes.data?.$values
        ? engineersRes.data.$values
        : [];
      const classesData = Array.isArray(classesRes.data)
        ? classesRes.data
        : classesRes.data?.$values
        ? classesRes.data.$values
        : [];
      const assignmentsData = Array.isArray(assignmentsRes.data)
        ? assignmentsRes.data
        : assignmentsRes.data?.$values
        ? assignmentsRes.data.$values
        : [];

      // Normalize IDs
      const normalizedEngineers = engineersData.map((e) => ({
        ...e,
        id: Number(e.id ?? e.Id),
        fullNameEn: e.fullNameEn ?? e.FullNameEN ?? e.fullNameAr ?? 'Engineer',
      }));

      const normalizedClasses = classesData.map((c) => ({
        ...c,
        id: Number(c.id ?? c.Id),
        className: c.className ?? c.ClassName ?? `Class #${c.id}`,
        gradeName: c.gradeName ?? c.GradeName ?? '',
      }));

      const normalizedAssignments = assignmentsData.map((a) => ({
        ...a,
        accountId: Number(a.accountId ?? a.AccountId),
        assignedClassId: Number(a.assignedClassId ?? a.AssignedClassId),
      }));

      setEngineers(normalizedEngineers);
      setClasses(normalizedClasses);
      setAssignments(normalizedAssignments);
    } catch (error) {
      console.error('Error fetching data:', error);
      showError(`Error loading data: ${error.response?.data?.error || error.message}`);
    } finally {
      setLoading(false);
    }
  };

  // Map classId -> className
  const classLabelMap = useMemo(() => {
    const map = {};
    classes.forEach((c) => {
      map[c.id] = c.className;
    });
    return map;
  }, [classes]);

  // Map engineerId -> classId (first assigned class)
  const engineerClassMap = useMemo(() => {
    const map = {};
    assignments.forEach((a) => {
      if (a.accountId && a.assignedClassId) {
        map[a.accountId] = a.assignedClassId;
      }
    });
    return map;
  }, [assignments]);

  // Filtered engineers for search
  const filteredEngineers = useMemo(() => {
    if (!search.trim()) return engineers;
    const q = search.toLowerCase();
    return engineers.filter(
      (e) =>
        (e.fullNameEn || '').toLowerCase().includes(q) ||
        (e.fullNameAr || '').toLowerCase().includes(q) ||
        (e.email || '').toLowerCase().includes(q)
    );
  }, [engineers, search]);

  const unassignedEngineers = useMemo(() => {
    return filteredEngineers.filter((e) => !engineerClassMap[e.id]);
  }, [filteredEngineers, engineerClassMap]);

  const assignedEngineers = useMemo(() => {
    return filteredEngineers.filter((e) => !!engineerClassMap[e.id]);
  }, [filteredEngineers, engineerClassMap]);

  /* ── Drag & Drop Handler ─────────────────────────────────── */
  const handleDragEnd = async (e) => {
    const { active, over } = e;
    setActiveEngineer(null);
    if (!over) return;

    const engineer = active.data.current?.engineer;
    const overIdStr = String(over.id);
    if (!engineer || !overIdStr.startsWith('class-')) return;

    const targetClassId = parseInt(overIdStr.replace('class-', ''), 10);
    if (isNaN(targetClassId)) return;

    const engId = Number(engineer.id);

    // Check if already assigned to this exact class
    if (engineerClassMap[engId] === targetClassId) {
      showWarning(`${engineer.fullNameEn} is already assigned to this class`);
      return;
    }

    try {
      await axiosInstance.post(`/Account/AssignEngineerToClass`, {
        AccountId: engId,
        ClassId: targetClassId,
      });

      showSuccess(`Assigned ${engineer.fullNameEn} successfully!`);
      fetchData();
    } catch (error) {
      console.error('Error assigning engineer:', error);
      showError(`Failed to assign engineer: ${error.response?.data?.error || error.message}`);
    }
  };

  /* ── Manual Dropdown Assign ──────────────────────────────── */
  const handleManualAssign = async () => {
    if (!selectedEngineer || !selectedClass) {
      showWarning('Please select both engineer and class');
      return;
    }

    try {
      await axiosInstance.post(`/Account/AssignEngineerToClass`, {
        AccountId: parseInt(selectedEngineer, 10),
        ClassId: parseInt(selectedClass, 10),
      });

      showSuccess('Engineer assigned to class successfully!');
      setSelectedEngineer('');
      setSelectedClass('');
      fetchData();
    } catch (error) {
      console.error('Error assigning engineer:', error);
      showError(`Error assigning engineer: ${error.response?.data?.error || error.message}`);
    }
  };

  /* ── Remove Assignment ───────────────────────────────────── */
  const handleRemoveAssignment = (accountId) => {
    const engineer = engineers.find((e) => e.id === Number(accountId));
    const name = engineer?.fullNameEn || 'this engineer';

    setConfirmationDialog({
      isOpen: true,
      title: 'Remove Assignment',
      message: `Are you sure you want to unassign ${name}?`,
      onConfirm: () => confirmRemoveAssignment(accountId),
      type: 'danger',
    });
  };

  const confirmRemoveAssignment = async (accountId) => {
    try {
      await axiosInstance.delete(`/Account/RemoveAssignment/${accountId}`);
      showSuccess('Assignment removed successfully!');
      fetchData();
    } catch (error) {
      console.error('Error removing assignment:', error);
      showError(`Error removing assignment: ${error.response?.data?.error || error.message}`);
    } finally {
      setConfirmationDialog({
        isOpen: false,
        title: '',
        message: '',
        onConfirm: null,
        type: 'warning',
      });
    }
  };

  return (
    <div className="step-page step2-assign-engineers bg-slate-50/50 p-4 rounded-2xl">
      {/* Step Header */}
      <div className="step-header bg-white border border-slate-200 rounded-xl p-4 shadow-sm mb-4">
        <div className="step-title">
          <UserPlus className="step-title-icon text-red-600" />
          <div>
            <h2 className="text-slate-800 font-bold">Assign Engineers to Classes</h2>
            <p className="text-slate-500">Drag and drop engineers into classes to set up supervision</p>
          </div>
        </div>
        <button
          onClick={fetchData}
          disabled={loading}
          className="px-3 py-1.5 rounded-lg border border-slate-200 hover:bg-slate-100 text-xs font-semibold flex items-center gap-1.5 text-slate-700 transition-all cursor-pointer bg-white"
          title="Refresh Data"
        >
          <RefreshCw size={13} className={loading ? 'animate-spin text-red-600' : 'text-slate-500'} />
          <span>Refresh</span>
        </button>
      </div>

      <div className="step-content flex flex-col gap-6">
        {/* Quick Assign Dropdown Form (Backup) */}
        <div className="bg-white border border-slate-200 rounded-xl p-4 shadow-sm">
          <div className="flex items-center justify-between mb-3">
            <span className="text-xs font-bold uppercase tracking-wider text-slate-600 flex items-center gap-1.5">
              <Sparkles size={14} className="text-red-600" /> Quick Select Assignment
            </span>
          </div>
          <div className="flex flex-wrap items-center gap-3">
            <select
              value={selectedEngineer}
              onChange={(e) => setSelectedEngineer(e.target.value)}
              className="flex-1 min-w-[200px] px-3 py-2 text-xs rounded-lg border border-slate-200 bg-slate-50 text-slate-800 outline-none focus:ring-2 focus:ring-red-500/40 focus:bg-white"
            >
              <option value="">Select an engineer...</option>
              {unassignedEngineers.map((e) => (
                <option key={e.id} value={e.id}>
                  {e.fullNameEn} ({e.email})
                </option>
              ))}
            </select>
            <select
              value={selectedClass}
              onChange={(e) => setSelectedClass(e.target.value)}
              className="flex-1 min-w-[200px] px-3 py-2 text-xs rounded-lg border border-slate-200 bg-slate-50 text-slate-800 outline-none focus:ring-2 focus:ring-red-500/40 focus:bg-white"
            >
              <option value="">Select a class...</option>
              {classes.map((c) => (
                <option key={c.id} value={c.id}>
                  {c.className} ({c.gradeName})
                </option>
              ))}
            </select>
            <button
              onClick={handleManualAssign}
              disabled={!selectedEngineer || !selectedClass}
              className="px-4 py-2 text-xs font-bold text-white bg-red-600 hover:bg-red-700 disabled:opacity-50 rounded-lg flex items-center gap-1.5 transition-all cursor-pointer shadow-sm"
            >
              <Plus size={14} /> Assign
            </button>
          </div>
        </div>

        {/* Drag and Drop Board */}
        <DndContext
          sensors={sensors}
          onDragStart={(e) => setActiveEngineer(e.active.data.current?.engineer)}
          onDragEnd={handleDragEnd}
        >
          {/* Search & Engineer Roster */}
          <div className="bg-white border border-slate-200 rounded-xl p-5 shadow-sm">
            <div className="relative mb-4">
              <Search size={15} className="absolute left-3 top-1/2 -translate-y-1/2 text-slate-400" />
              <input
                type="text"
                placeholder="Search engineers by name or email…"
                value={search}
                onChange={(e) => setSearch(e.target.value)}
                className="w-full pl-9 pr-4 py-2.5 text-sm rounded-lg border border-slate-200 bg-slate-50 outline-none focus:ring-2 focus:ring-red-500/40 text-slate-800 focus:bg-white"
              />
            </div>

            {/* Unassigned Engineers */}
            <div>
              <div className="flex items-center justify-between mb-2">
                <span className="text-xs font-bold uppercase tracking-wider text-slate-600">
                  Unassigned Engineers ({unassignedEngineers.length})
                </span>
                <span className="text-[11px] text-slate-400">Drag chip to assign</span>
              </div>
              {unassignedEngineers.length > 0 ? (
                <div className="flex flex-wrap gap-2">
                  {unassignedEngineers.map((eng) => (
                    <EngineerChip key={eng.id} engineer={eng} sourceId={`search-${eng.id}`} />
                  ))}
                </div>
              ) : (
                <p className="text-xs text-slate-400 italic py-1">
                  {search ? 'No unassigned engineers match search.' : 'All engineers are assigned to classes!'}
                </p>
              )}
            </div>

            {/* Assigned Engineers Roster */}
            {assignedEngineers.length > 0 && (
              <div className="mt-4 pt-3 border-t border-slate-100">
                <div className="flex items-center justify-between mb-2">
                  <span className="text-xs font-bold uppercase tracking-wider text-amber-700">
                    Assigned Engineers ({assignedEngineers.length})
                  </span>
                </div>
                <div className="flex flex-wrap gap-2">
                  {assignedEngineers.map((eng) => (
                    <EngineerChip
                      key={eng.id}
                      engineer={eng}
                      assignedTo={classLabelMap[engineerClassMap[eng.id]]}
                      sourceId={`search-${eng.id}`}
                    />
                  ))}
                </div>
              </div>
            )}
          </div>

          {/* Class Cards Grid */}
          <div>
            <div className="flex items-center justify-between mb-3">
              <h3 className="text-sm font-extrabold text-slate-800 flex items-center gap-2">
                <Users size={16} className="text-red-600" /> Classes ({classes.length})
              </h3>
              <span className="text-xs text-slate-500">
                Total Assignments: <strong className="text-red-600 font-extrabold">{assignments.length}</strong>
              </span>
            </div>

            {loading ? (
              <div className="flex flex-col items-center justify-center p-12 bg-white border border-slate-200 rounded-xl">
                <div className="w-8 h-8 border-4 border-red-600 border-t-transparent rounded-full animate-spin mb-3"></div>
                <p className="text-xs text-slate-500">Loading class assignments...</p>
              </div>
            ) : (
              <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-4">
                {classes.map((cls) => {
                  const assignedToThisClass = assignments
                    .filter((a) => Number(a.assignedClassId) === Number(cls.id))
                    .map((a) => {
                      const eng = engineers.find((e) => Number(e.id) === Number(a.accountId));
                      return (
                        eng || {
                          id: Number(a.accountId),
                          fullNameEn: a.accountName || `Engineer #${a.accountId}`,
                        }
                      );
                    });

                  return (
                    <ClassCard
                      key={cls.id}
                      id={cls.id}
                      label={cls.className}
                      gradeName={cls.gradeName}
                      engineers={assignedToThisClass}
                      onRemove={(engId) => handleRemoveAssignment(engId)}
                    />
                  );
                })}
              </div>
            )}
          </div>

          {/* Drag Overlay */}
          <DragOverlay>
            {activeEngineer && <EngineerChip engineer={activeEngineer} overlay />}
          </DragOverlay>
        </DndContext>
      </div>

      {/* Confirmation Dialog */}
      <ConfirmationDialog
        isOpen={confirmationDialog.isOpen}
        title={confirmationDialog.title}
        message={confirmationDialog.message}
        onConfirm={confirmationDialog.onConfirm}
        onCancel={() =>
          setConfirmationDialog({
            isOpen: false,
            title: '',
            message: '',
            onConfirm: null,
            type: 'warning',
          })
        }
        confirmText="Remove"
        cancelText="Cancel"
        type={confirmationDialog.type}
      />
    </div>
  );
};

export default Step2AssignEngineers;